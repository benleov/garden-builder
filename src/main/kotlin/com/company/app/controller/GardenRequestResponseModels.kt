package com.company.app.controller

import com.company.app.repository.entity.garden.Garden
import com.company.app.repository.entity.garden.Season
import com.company.app.repository.entity.garden.SectionGroup
import com.company.app.repository.entity.garden.SectionSnapshot
import com.company.app.repository.entity.garden.SectionState
import com.company.app.repository.entity.garden.SectionTreatment
import com.company.app.repository.entity.garden.TreatmentType
import com.company.app.repository.entity.layout.Layout
import com.company.app.repository.entity.layout.Section
import com.company.app.repository.entity.plant.Plant
import java.time.Instant

data class DTOGarden(
  val id: String? = null,
  val name: String? = null,
  val year: Int? = null,
  val season: String? = null,
  val layoutId: String,
  val sectionStates: List<DTOSectionState>,
  val sectionGroups: List<DTOSectionGroup>,
) {
  companion object {
    fun fromEntity(garden: Garden): DTOGarden {
      return DTOGarden(
        id = garden.id,
        name = garden.name,
        year = garden.year,
        layoutId = garden.layout!!.id!!,
        season = garden.season?.name,
        sectionStates =
          garden.sectionStates?.map {
            DTOSectionState.fromEntity(it)
          } ?: listOf(),
        sectionGroups =
          garden.sectionGroups?.map {
            DTOSectionGroup.fromEntity(it)
          } ?: listOf(),
      )
    }

    fun toEntity(
      garden: DTOGarden,
      layout: Layout,
      plants: List<Plant>,
      sections: List<Section>,
    ): Garden {
      return Garden(
        id = garden.id,
        name = garden.name,
        year = garden.year,
        layout = layout,
        season = garden.season?.let { Season.valueOf(it) },
        sectionStates =
          garden.sectionStates.map {
            DTOSectionState.toEntity(it, plants, sections.find { section -> section.id == it.sectionId })
          }.toMutableList(),
        sectionGroups =
          garden.sectionGroups.map {
            DTOSectionGroup.toEntity(it)
          }.toMutableList(),
      )
    }
  }
}

data class DTOSectionState(
  val id: String? = null,
  val sectionId: String?,
  val snapshots: List<DTOSectionSnapshot>,
) {
  companion object {
    fun fromEntity(sectionState: SectionState): DTOSectionState {
      return DTOSectionState(
        id = sectionState.id,
        sectionId = sectionState.section?.id,
        snapshots =
          sectionState.snapshots?.map {
            DTOSectionSnapshot.fromEntity(it)
          } ?: listOf(),
      )
    }

    fun toEntity(
      sectionState: DTOSectionState,
      plants: List<Plant>,
      section: Section? = null,
    ): SectionState {
      return SectionState(
        id = sectionState.id,
        section = section,
        snapshots =
          sectionState.snapshots.map {
            DTOSectionSnapshot.toEntity(it, plants.find { plant -> plant.id == it.plantId })
          }.toMutableList(),
      )
    }
  }
}

data class DTOSectionSnapshot(
  val id: String? = null,
  val sectionStateId: String? = null,
  val plantId: String?,
  val plantingTimestamp: Instant?,
  val harvestedTimestamp: Instant?,
  val sectionTreatments: List<DTOSectionTreatment>?,
) {
  companion object {
    fun fromEntity(snapshot: SectionSnapshot): DTOSectionSnapshot {
      return DTOSectionSnapshot(
        id = snapshot.id,
        plantId = snapshot.plant?.id,
        plantingTimestamp = snapshot.plantingTimestamp,
        harvestedTimestamp = snapshot.harvestedTimestamp,
        sectionTreatments =
          snapshot.sectionTreatments?.map {
            DTOSectionTreatment(
              id = it.id,
              treatmentType = it.treatmentType,
              treatmentTimestamp = it.treatmentTimestamp,
            )
          },
      )
    }

    fun toEntity(
      snapshot: DTOSectionSnapshot,
      plant: Plant?,
    ): SectionSnapshot {
      return SectionSnapshot(
        id = snapshot.id,
        plant = plant,
        plantingTimestamp = snapshot.plantingTimestamp,
        harvestedTimestamp = snapshot.harvestedTimestamp,
        sectionTreatments =
          snapshot.sectionTreatments?.map {
            SectionTreatment(
              id = it.id,
              treatmentType = it.treatmentType,
              treatmentTimestamp = it.treatmentTimestamp,
            )
          },
      )
    }
  }
}

data class DTOSectionTreatment(
  val id: String? = null,
  val treatmentType: TreatmentType? = null,
  val treatmentTimestamp: Instant? = null,
)

data class DTOSectionGroup(
  val id: String? = null,
  val name: String? = null,
  val colour: String? = null,
  val sections: List<DTOSection>? = null,
) {
  companion object {
    fun toEntity(sectionGroup: DTOSectionGroup): SectionGroup {
      return SectionGroup(
        id = sectionGroup.id,
        name = sectionGroup.name,
        colour = sectionGroup.colour,
        sections =
          sectionGroup.sections?.map {
            Section(
              id = it.id,
            )
          },
      )
    }

    fun fromEntity(sectionGroup: SectionGroup): DTOSectionGroup {
      return DTOSectionGroup(
        id = sectionGroup.id,
        name = sectionGroup.name,
        colour = sectionGroup.colour,
        sections =
          sectionGroup.sections?.map {
            DTOSection(
              id = it.id,
            )
          },
      )
    }
  }
}
