package com.company.app.client.growstuff.models

/**
 *
 * @param &#x60;data&#x60; Data
 * @param meta
 * @param links
 */
data class GetCropsResponse(
  // Data
  val data: Array<GetCropsDataResponse>,
  val meta: GetCropsMetaResponse? = null,
  val links: GetCropsLinksResponse? = null,
) {
  override fun equals(other: Any?): Boolean {
    if (this === other) return true
    if (javaClass != other?.javaClass) return false

    other as GetCropsResponse

    if (!`data`.contentEquals(other.`data`)) return false
    if (meta != other.meta) return false
    if (links != other.links) return false

    return true
  }

  override fun hashCode(): Int {
    var result = `data`.contentHashCode()
    result = 31 * result + (meta?.hashCode() ?: 0)
    result = 31 * result + (links?.hashCode() ?: 0)
    return result
  }
}
