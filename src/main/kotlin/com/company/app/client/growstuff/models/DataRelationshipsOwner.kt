package com.company.app.client.growstuff.models

/**
 * Related model
 * @param links
 */
data class DataRelationshipsOwner(
  val links: DataRelationshipOwnerLinks? = null,
  val data: List<CropPhotoData>? = null,
)

data class CropPhotoData(val type: String, val id: Int)
