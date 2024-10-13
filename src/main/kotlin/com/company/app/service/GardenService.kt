@file:Suppress("TooManyFunctions")

package com.company.app.service

import com.company.app.EntityNotFoundException
import com.company.app.controller.DTOGarden
import com.company.app.controller.DTOSectionGroup
import com.company.app.controller.DTOSectionSnapshot
import com.company.app.controller.DTOSectionState
import com.company.app.repository.GardenRepository
import com.company.app.repository.LayoutRepository
import com.company.app.repository.PlantRepository
import com.company.app.repository.SectionRepository
import com.company.app.repository.SectionSnapshotRepository
import com.company.app.repository.SectionStateRepository
import com.company.app.repository.entity.garden.Garden
import com.company.app.repository.entity.garden.SectionGroup
import com.company.app.repository.entity.garden.SectionSnapshot
import com.company.app.repository.entity.garden.SectionState
import com.company.app.repository.entity.garden.SectionTreatment
import com.company.app.repository.entity.layout.Section
import com.company.app.repository.entity.plant.Plant
import org.springframework.stereotype.Service
import java.time.Instant

@Service
class GardenService(
  private val gardenRepository: GardenRepository,
  private val layoutRepository: LayoutRepository,
  private val sectionSnapshotRepository: SectionSnapshotRepository,
  private val sectionStateRepository: SectionStateRepository,
  private val plantRepository: PlantRepository,
  private val sectionRepository: SectionRepository,
) {
  fun getGardenById(id: String): Garden = gardenRepository.getReferenceById(id)

  fun deleteGarden(id: String) = gardenRepository.deleteById(id)

  fun createSectionState(
    gardenId: String,
    request: DTOSectionState,
  ): SectionState {
    val plants =
      request.snapshots.mapNotNull { it.plantId }.mapNotNull {
          plantId ->
        plantRepository.getReferenceById(plantId)
      }
    val section = sectionRepository.findById(request.sectionId!!).get()
    val sectionState = DTOSectionState.toEntity(request, plants, section)

    if (sectionState.snapshots != null) {
      sectionSnapshotRepository.saveAll(sectionState.snapshots!!)
    }
    val garden = getGardenById(gardenId)

    if (garden.sectionStates !== null) {
      garden.sectionStates?.add(sectionState)
    } else {
      garden.sectionStates = mutableListOf(sectionState)
    }
    val state = sectionStateRepository.save(sectionState)
    gardenRepository.save(garden)
    return state
  }

  fun createSectionStates(
    gardenId: String,
    request: List<DTOSectionState>,
  ): List<SectionState> {
    val garden = getGardenById(gardenId)
    val states =
      request.map { state ->
        val plants = plantRepository.findAllById(state.snapshots.map { it.plantId })
        val section = sectionRepository.findById(state.sectionId!!).get()
        DTOSectionState.toEntity(state, plants, section)
      }

    states.mapNotNull { it.snapshots }.flatten().also { sectionSnapshotRepository.saveAll(it) }

    if (garden.sectionStates !== null) {
      garden.sectionStates?.addAll(states)
    } else {
      garden.sectionStates = states.toMutableList()
    }
    val saved = sectionStateRepository.saveAll(states)
    gardenRepository.save(garden)
    return saved
  }

  /**
   * Partial update of a section state.
   *
   * Existing snapshots will be updated.
   * New snapshots will be created.
   */
  @Suppress("UnusedPrivateMember")
  fun patchSectionStates(
    gardenId: String,
    request: List<DTOSectionState>,
  ): List<SectionState> {
    val sectionStates = sectionStateRepository.findAllById(request.map { it.id })

    return request.map { inbound ->
      val entity = sectionStates.find { it.id == inbound.id }
      val plants = inbound.snapshots.map { plantRepository.getReferenceById(it.plantId!!) }

      inbound.snapshots.forEach { inboundSnapshot ->
        val existing = entity?.snapshots?.find { inboundSnapshot.id == it.id }

        if (existing != null) {
          mergeSectionStateSnapshot(inboundSnapshot, existing, plants.find { it.id == inboundSnapshot.plantId })
        } else {
          entity?.snapshots?.add(
            DTOSectionSnapshot.toEntity(
              inboundSnapshot,
              plants.find { it.id == inboundSnapshot.plantId },
            ),
          )
        }
      }
      sectionStateRepository.save(entity!!)
    }
  }

  @Suppress("UnusedPrivateMember")
  fun updateSectionState(
    gardenId: String,
    sectionStateId: String,
    request: DTOSectionState,
  ): SectionState {
    val plants = request.snapshots.map { plantRepository.getReferenceById(it.plantId!!) }
    val section = sectionRepository.findById(request.sectionId!!).get()
    val updatedSectionState = DTOSectionState.toEntity(request, plants, section)
    val existing = sectionStateRepository.getReferenceById(sectionStateId)
    existing.section = updatedSectionState.section
    existing.snapshots?.clear()
    existing.snapshots?.addAll(updatedSectionState.snapshots!!.toList())
    return sectionStateRepository.save(existing)
  }

  @Suppress("UnusedPrivateMember")
  fun deleteSectionState(
    gardenId: String,
    sectionStateId: String,
  ) {
    this.sectionSnapshotRepository.deleteById(sectionStateId)
  }

  @Suppress("UnusedPrivateMember")
  fun updateSectionStateSnapshot(
    gardenId: String,
    sectionSnapshotId: String,
    request: DTOSectionSnapshot,
  ): SectionSnapshot {
    val plant = plantRepository.findById(request.plantId!!).get()
    val existing = sectionSnapshotRepository.getReferenceById(sectionSnapshotId)
    mergeSectionStateSnapshot(request, existing, plant)
    return sectionSnapshotRepository.save(existing)
  }

  fun mergeSectionStateSnapshot(
    updated: DTOSectionSnapshot,
    original: SectionSnapshot,
    plant: Plant?,
  ) {
    original.plant = plant
    original.plantingTimestamp = updated.plantingTimestamp
    original.harvestedTimestamp = updated.harvestedTimestamp
    original.sectionTreatments =
      updated.sectionTreatments?.map {
        SectionTreatment(
          it.id,
          it.treatmentType,
          it.treatmentTimestamp,
        )
      }
  }

  fun createSectionStateSnapshot(
    gardenId: String,
    sectionStateId: String,
    request: DTOSectionSnapshot,
  ): SectionSnapshot {
    val garden = getGardenById(gardenId)
    val plant = plantRepository.findById(request.plantId!!).get()
    val entity = DTOSectionSnapshot.toEntity(request, plant)
    val sectionState = garden.sectionStates?.find { it.id == sectionStateId }
    sectionState!!.snapshots?.add(entity) ?: mutableListOf(entity)
    val updated = sectionSnapshotRepository.save(entity)
    gardenRepository.save(garden)
    return updated
  }

  fun deleteSectionSnapshot(
    gardenId: String,
    sectionStateId: String,
    sectionSnapshotId: String,
  ) {
    val garden = getGardenById(gardenId)
    val sectionState =
      garden.sectionStates?.find { it.id == sectionStateId }
        ?: throw EntityNotFoundException("Section state with id $sectionStateId not found")
    val snapshot =
      sectionState.snapshots?.find { it.id == sectionSnapshotId }
        ?: throw EntityNotFoundException("Snapshot with id $sectionSnapshotId not found")
    sectionState.snapshots?.remove(snapshot)
    sectionStateRepository.save(sectionState)
  }

  @Suppress("UnusedPrivateMember")
  fun getSectionStateById(
    gardenId: String,
    sectionStateId: String,
  ): SectionState {
    return sectionStateRepository.getReferenceById(sectionStateId)
  }

  fun saveSectionGroup(
    sectionGroupId: String?,
    gardenId: String,
    request: DTOSectionGroup,
  ): SectionGroup {
    val garden = getGardenById(gardenId)
    val existingSectionGroups = garden.sectionGroups?.map { it.hashCode() }
    val entity =
      if (sectionGroupId == null) {
        DTOSectionGroup.toEntity(request)
      } else {
        val existing =
          garden.sectionGroups?.find { it.id == sectionGroupId }
            ?: throw EntityNotFoundException("SectionGroup with id $sectionGroupId not found.")
        existing.colour = request.colour
        existing.sections = request.sections?.map { Section(id = it.id) }
        existing
      }

    if (sectionGroupId == null) {
      garden.sectionGroups?.add(entity) ?: mutableListOf(entity)
    }
    val saved = gardenRepository.save(garden)
    val newSectionId = saved.sectionGroups?.find { existingSectionGroups?.contains(it.hashCode()) == false }?.id
    return entity.copy(id = newSectionId)
  }

  fun saveGarden(request: DTOGarden): Garden {
    val layout = layoutRepository.findById(request.layoutId)
    val entity = DTOGarden.toEntity(request, layout.get(), listOf(), listOf())
    return gardenRepository.save(entity)
  }

  /**
   *  Parameters allow filtering out of snapshots so the frontend will only see 'active' snapshots for the provided
   *  time period. Active snapshots being defined as the state where the current time is in between planting and
   *  harvesting (or after planting if no harvesting timestamp has been set).
   *
   *  For example, to get the current active snapshots in a given month, it must have:
   *
   *  - Been planted BEFORE the last day of the current month.
   *  - Been harvested AFTER the first day of the current month, or not at all.
   */
  fun getAllGardens(
    plantedBefore: Instant?,
    harvestedBefore: Instant?,
    harvestedAfter: Instant?,
  ): List<Garden> {
    val gardens = gardenRepository.findAll()

    fun retainSnapshots(check: (snapshot: SectionSnapshot) -> Boolean) {
      gardens.forEach {
        it.sectionStates?.forEach { sectionState ->
          sectionState.snapshots?.retainAll { snapshot ->
            check(snapshot)
          }
        }
      }
    }

    if (plantedBefore !== null) {
      retainSnapshots {
        it.plantingTimestamp?.isBefore(plantedBefore) ?: true
      }
    }

    if (harvestedBefore !== null) {
      retainSnapshots {
        it.harvestedTimestamp?.isBefore(harvestedBefore) ?: true
      }
    }

    if (harvestedAfter !== null) {
      retainSnapshots {
        it.harvestedTimestamp?.isAfter(harvestedAfter) ?: true
      }
    }

    return gardens
  }
}
