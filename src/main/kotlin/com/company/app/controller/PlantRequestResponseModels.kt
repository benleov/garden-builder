package com.company.app.controller

import com.company.app.repository.entity.plant.HardinessZone
import com.company.app.repository.entity.plant.MonthHardinessZone
import com.company.app.repository.entity.plant.Plant
import com.company.app.repository.entity.plant.PlantFamily
import com.company.app.repository.entity.plant.PlantPosition
import com.company.app.repository.entity.plant.PlantTask
import com.company.app.repository.entity.plant.PlantTaskType
import java.time.Duration
import java.time.Month

data class DTOPlant(
  val id: String? = null,
  val name: String? = null,
  val variety: String? = null,
  val family: PlantFamily? = null,
  val species: String? = null,
  val emojiCodePoint: String? = null,
  val thumbnailUrl: String? = null,
  val fullSizeUrl: String? = null,
  val perennial: Boolean? = null,
  val medianDaysLifespan: Int? = null,
  val medianDaysToFirstHarvest: Int? = null,
  val medianDaysToLastHarvest: Int? = null,
  val heightRangeCm: Int? = null,
  val spacingCm: Int? = null,
  val position: PlantPosition? = null,
  val wateringLevel: Int? = null,
  val sowingMonthHardinessZones: List<DTOMonthHardinessZone>? = null,
  val companionPlants: List<DTOPlant>? = null,
  val plantTasks: List<DTOPlantTask>? = null,
) {
  companion object {
    fun fromEntity(plant: Plant): DTOPlant {
      return DTOPlant(
        id = plant.id,
        name = plant.name,
        variety = plant.variety,
        family = plant.family,
        species = plant.species,
        emojiCodePoint = plant.emojiCodePoint,
        thumbnailUrl = plant.thumbnailUrl,
        fullSizeUrl = plant.fullSizeUrl,
        perennial = plant.perennial,
        medianDaysLifespan = plant.medianDaysLifespan,
        medianDaysToFirstHarvest = plant.medianDaysToFirstHarvest,
        medianDaysToLastHarvest = plant.medianDaysToLastHarvest,
        heightRangeCm = plant.heightRangeCm,
        spacingCm = plant.spacingCm,
        position = plant.position,
        wateringLevel = plant.wateringLevel,
        sowingMonthHardinessZones =
          plant.sowingMonthHardinessZones?.map {
            DTOMonthHardinessZone(
              it.id,
              it.month,
              it.hardinessZone,
            )
          },
        companionPlants = plant.companionPlants?.map { fromEntity(it) },
        plantTasks = plant.plantTasks?.map { DTOPlantTask.fromEntity(it) },
      )
    }

    fun toEntity(
      plant: DTOPlant,
      id: String? = null,
    ): Plant {
      return Plant(
        id = id,
        name = plant.name,
        variety = plant.variety,
        family = plant.family,
        species = plant.species,
        emojiCodePoint = plant.emojiCodePoint,
        thumbnailUrl = plant.thumbnailUrl,
        fullSizeUrl = plant.fullSizeUrl,
        perennial = plant.perennial,
        medianDaysLifespan = plant.medianDaysLifespan,
        medianDaysToFirstHarvest = plant.medianDaysToFirstHarvest,
        medianDaysToLastHarvest = plant.medianDaysToLastHarvest,
        heightRangeCm = plant.heightRangeCm,
        spacingCm = plant.spacingCm,
        position = plant.position,
        wateringLevel = plant.wateringLevel,
        sowingMonthHardinessZones =
          plant.sowingMonthHardinessZones?.map {
            MonthHardinessZone(
              it.id,
              it.month,
              it.hardinessZone,
            )
          }?.toMutableList(),
        companionPlants = plant.companionPlants?.map { toEntity(it) },
        plantTasks = plant.plantTasks?.map { DTOPlantTask.toEntity(it) },
      )
    }
  }
}

data class DTOPlantTask(
  val id: String?,
  val type: PlantTaskType?,
  val startOffset: Duration? = null,
) {
  companion object {
    fun fromEntity(task: PlantTask): DTOPlantTask {
      return DTOPlantTask(
        id = task.id,
        type = task.type,
        startOffset = task.startOffset,
      )
    }

    fun toEntity(task: DTOPlantTask): PlantTask {
      return PlantTask(
        id = task.id,
        type = task.type,
        startOffset = task.startOffset,
      )
    }
  }
}

data class DTOMonthHardinessZone(val id: String?, val month: Month?, val hardinessZone: HardinessZone?)
