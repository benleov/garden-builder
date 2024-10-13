package com.company.app.client.growstuff.models

/**
 * Data
 * @param id ID
 * @param type Type
 * @param links
 * @param attributes
 * @param relationships
 */
data class GetPhotosDataResponse(
  // ID
  val id: String? = null,
  // Type
  val type: String? = null,
  val links: GetCropsDataLinksResponse? = null,
  val attributes: GetPhotosAttributesResponse? = null,
  val relationships: GetPhotosRelationshipsResponse? = null,
)
