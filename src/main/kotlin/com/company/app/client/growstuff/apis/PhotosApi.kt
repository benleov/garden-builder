@file:Suppress("ComplexMethod", "ReturnCount", "ThrowsCount", "LongParameterList")

package com.company.app.client.growstuff.apis

import com.company.app.client.growstuff.infrastructure.ApiClient
import com.company.app.client.growstuff.infrastructure.ClientError
import com.company.app.client.growstuff.infrastructure.ClientException
import com.company.app.client.growstuff.infrastructure.MultiValueMap
import com.company.app.client.growstuff.infrastructure.RequestConfig
import com.company.app.client.growstuff.infrastructure.RequestMethod
import com.company.app.client.growstuff.infrastructure.ResponseType
import com.company.app.client.growstuff.infrastructure.ServerError
import com.company.app.client.growstuff.infrastructure.ServerException
import com.company.app.client.growstuff.infrastructure.Success
import com.company.app.client.growstuff.models.GetPhotosResponse

class PhotosApi(basePath: String = "/") : ApiClient(basePath) {
  /**
   * photos Detail
   *
   */
  @Suppress("UNCHECKED_CAST")
  fun apiV1PhotosIdGet(
    id: Int,
    include: String? = null,
    fieldsPhotos: String? = null,
    fieldsMembers: String? = null,
    fieldsPlantings: String? = null,
    fieldsGardens: String? = null,
    fieldsHarvests: String? = null,
  ): GetPhotosResponse {
    val localVariableQuery: MultiValueMap =
      mapOf(
        "include" to listOf("$include"),
        "fields[photos]" to listOf("$fieldsPhotos"),
        "fields[members]" to listOf("$fieldsMembers"),
        "fields[plantings]" to listOf("$fieldsPlantings"),
        "fields[gardens]" to listOf("$fieldsGardens"),
        "fields[harvests]" to listOf("$fieldsHarvests"),
      ).filterValues { !it.contains("null") }

    val localVariableConfig =
      RequestConfig(
        RequestMethod.GET,
        "/api/v1/photos/{id}".replace("{" + "id" + "}", "$id"),
        query = localVariableQuery,
      )
    val response =
      request<GetPhotosResponse>(
        localVariableConfig,
      )

    return when (response.responseType) {
      ResponseType.Success -> (response as Success<*>).data as GetPhotosResponse
      ResponseType.Informational -> TODO()
      ResponseType.Redirection -> TODO()
      ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
      ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
    }
  }
}
