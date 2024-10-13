package com.company.app.controller.exceptions

abstract class ApiSubError

class ApiValidationError(
  val `object`: String,
  val message: String,
  val field: String? = null,
  val rejectedValue: Any? = null,
)
