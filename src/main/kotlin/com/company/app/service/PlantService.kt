package com.company.app.service

import com.company.app.client.growstuff.apis.CropsApi
import com.company.app.controller.DTOPlant
import com.company.app.repository.PlantRepository
import com.company.app.repository.entity.plant.Plant
import jakarta.persistence.EntityNotFoundException
import org.springframework.stereotype.Service
import org.springframework.web.util.UriComponentsBuilder

@Service
class PlantService(private val plantRepository: PlantRepository) {
  companion object {
    const val PAGE_SIZE = 20
  }

  fun getPlantById(id: String): Plant = plantRepository.getReferenceById(id)

  fun getAllPlants(): List<Plant> = plantRepository.findAll()

  fun savePlant(request: DTOPlant): Plant = plantRepository.save(DTOPlant.toEntity(request))

  fun updatePlant(
    id: String,
    request: DTOPlant,
  ): Plant {
    if (plantRepository.existsById(id)) {
      val updated = DTOPlant.toEntity(request, id)
      return plantRepository.save(updated)
    } else {
      throw EntityNotFoundException("Plant with id: $id could not be found")
    }
  }

  fun deletePlantById(id: String) = plantRepository.deleteById(id)

  @Suppress("SwallowedException")
  fun refreshPlantsFromGrowStuff() {
//    val photosApi = PhotosApi("https://www.growstuff.org")
    val cropsApi = CropsApi("https://www.growstuff.org")
    val pageLimit = PAGE_SIZE
    var pageOffset = 0
    var finished = false

    while (!finished) {
      val response =
        cropsApi.apiV1CropsGet(
          include = "photos",
          pageOffset = pageOffset.toString(),
          pageLimit = pageLimit.toString(),
        )
      val nextUrl = response.links?.next

      if (nextUrl == null) {
        println("Next url is null; this is the last page.")
        finished = true
      } else {
        val nextPageParameters =
          UriComponentsBuilder
            .fromUriString(nextUrl).build().queryParams
        pageOffset = nextPageParameters["page%5Boffset%5D"]!![0].toInt()
      }

      response.data.forEach {
        val attributes = it.attributes!!
        val plantName = attributes.name
        val perennial = attributes.perennial
        val medianLifespan = attributes.medianLifespan // nullable
        val medianDaysToFirstHarvest = attributes.medianDaysToFirstHarvest // nullable
        val medianDaysToLastHarvest = attributes.medianDaysToLastHarvest // nullable
        // NOTE: the api does not return the correct photo
//        val photos = it.relationships?.photos?.data?.filter { it.type == "photos" }
//        val firstPhoto = photos?.firstOrNull()
//        val photoId = firstPhoto?.id
//        val photoResponse = photoId?.let { it1 ->
//          try {
//            println("Retrieving photo with id: $it1")
//            photosApi.apiV1PhotosIdGet(id = it1)
//          } catch (clientException: ClientException) {
//            println("Error retrieving photo")
//            null
//          }
//        }
//        val photoAttributes = photoResponse?.data?.attributes
//        val thumbnailUrl = photoAttributes?.thumbnailUrl
//        val fullsizeUrl = photoAttributes?.fullsizeUrl
//        println(thumbnailUrl)
        val plant =
          Plant(
            name = plantName?.uppercase(),
            variety = null,
            perennial = perennial,
            medianDaysLifespan = medianLifespan,
            medianDaysToFirstHarvest = medianDaysToFirstHarvest,
            medianDaysToLastHarvest = medianDaysToLastHarvest,
            thumbnailUrl = null,
            fullSizeUrl = null,
          )

        println("Saving plant")
        println(plant)
        plantRepository.save(plant)
      }
    }
  }
}
