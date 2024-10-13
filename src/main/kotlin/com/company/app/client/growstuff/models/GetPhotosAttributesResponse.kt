package com.company.app.client.growstuff.models

import com.squareup.moshi.Json

/**
 * Attributes
 * @param thumbnailUrl null
 * @param fullsizeUrl null
 * @param licenseName null
 * @param linkUrl null
 * @param title null
 *
 */
data class GetPhotosAttributesResponse(
  // null
  @Json(name = "thumbnail-url")
  val thumbnailUrl: String? = null,
  // null
  @Json(name = "fullsize-url")
  val fullsizeUrl: String? = null,
  // null
  @Json(name = "license-name")
  val licenseName: String? = null,
  // null
  @Json(name = "link-url")
  val linkUrl: String? = null,
  // null
  val title: String? = null,
)
