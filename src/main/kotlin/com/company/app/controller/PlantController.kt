package com.company.app.controller

import com.amazonaws.xray.spring.aop.XRayEnabled
import com.company.app.service.PlantService
import org.springframework.util.MimeTypeUtils
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/plants")
@XRayEnabled
@CrossOrigin
class PlantController(
  private val plantService: PlantService,
) {
  @PostMapping(consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE], produces = [MimeTypeUtils.APPLICATION_JSON_VALUE])
  fun savePlant(
    @RequestBody request: DTOPlant,
  ): DTOPlant {
    return DTOPlant.fromEntity(
      plantService.savePlant(request),
    )
  }

  @PutMapping(
    path = ["/{plantId}"],
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun updatePlant(
    @RequestBody request: DTOPlant,
    @PathVariable(name = "plantId") plantId: String,
  ): DTOPlant {
    return DTOPlant.fromEntity(
      plantService.updatePlant(plantId, request),
    )
  }

  @GetMapping(path = ["/"], produces = [MimeTypeUtils.APPLICATION_JSON_VALUE])
  fun getAllPlants(): List<DTOPlant> {
    return plantService.getAllPlants().map { DTOPlant.fromEntity(it) }
  }

  @GetMapping(path = ["/{plantId}"], produces = [MimeTypeUtils.APPLICATION_JSON_VALUE])
  fun getPlant(
    @PathVariable(name = "plantId") plantId: String,
  ): DTOPlant {
    return DTOPlant.fromEntity(
      plantService.getPlantById(plantId),
    )
  }

  @DeleteMapping(path = ["/{plantId}"])
  fun deletePlant(
    @PathVariable(name = "plantId") plantId: String,
  ) = plantService.deletePlantById(plantId)

  @PostMapping(path = ["/grow-stuff"])
  fun refreshPlantsFromGrowStuff() = plantService.refreshPlantsFromGrowStuff()
}
