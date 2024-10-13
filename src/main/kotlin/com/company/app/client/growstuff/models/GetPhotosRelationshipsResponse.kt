package com.company.app.client.growstuff.models

/**
 * Associate data
 * @param owner
 * @param plantings
 * @param gardens
 * @param harvests
 */
data class GetPhotosRelationshipsResponse(
  val owner: DataRelationshipsOwner? = null,
  val plantings: DataRelationshipsOwner? = null,
  val gardens: DataRelationshipsOwner? = null,
  val harvests: DataRelationshipsOwner? = null,
)
