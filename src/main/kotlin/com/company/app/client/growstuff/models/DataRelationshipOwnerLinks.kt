package com.company.app.client.growstuff.models

/**
 * Related link
 * @param self Associate list link
 * @param related Related link
 */
data class DataRelationshipOwnerLinks(
  // Associate list link
  val self: String? = null,
  // Related link
  val related: String? = null,
)
