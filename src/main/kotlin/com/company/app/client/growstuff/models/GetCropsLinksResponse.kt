package com.company.app.client.growstuff.models

/**
 * Page links
 * @param first First page link
 * @param next Next page link
 * @param last Last page link
 */
data class GetCropsLinksResponse(
  // First page link
  val first: String? = null,
  // Next page link
  val next: String? = null,
  // Last page link
  val last: String? = null,
)
