/**
 * API V1
 * No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)
 *
 * OpenAPI spec version: V1
 *
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */
package com.company.app.client.growstuff.models

/**
 * Meta
 * @param recordCount Record count
 * @param pageCount Page count
 */
data class GetCropsMetaResponse(
  // Record count
  val recordCount: kotlin.Int? = null,
  // Page count
  val pageCount: kotlin.Int? = null,
)
