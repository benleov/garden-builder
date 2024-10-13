package com.company.app.controller.exceptions

import com.fasterxml.jackson.annotation.JsonFormat
import org.springframework.http.HttpStatus
import java.time.LocalDateTime

class ApiError(
  val status: HttpStatus,
  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
  val timestamp: LocalDateTime = LocalDateTime.now(),
  val message: String? = null,
  val debugMessage: String? = null,
  val subErrors: List<ApiSubError>? = null,
) {
  constructor(status: HttpStatus, ex: Throwable) : this(
    status = status,
    message = "Unexpected error",
    debugMessage = ex.localizedMessage,
  )

  constructor(status: HttpStatus, message: String?, ex: Throwable) : this(
    status = status,
    message = message,
    debugMessage = ex.localizedMessage,
  )
}
