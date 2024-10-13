package com.company.app.controller.exceptions

import jakarta.persistence.EntityNotFoundException
import org.springframework.core.Ordered
import org.springframework.core.annotation.Order
import org.springframework.http.HttpHeaders
import org.springframework.http.HttpStatus
import org.springframework.http.HttpStatusCode
import org.springframework.http.ResponseEntity
import org.springframework.http.converter.HttpMessageNotReadableException
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.context.request.WebRequest
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler

@Order(Ordered.HIGHEST_PRECEDENCE)
@ControllerAdvice
class RestExceptionHandler : ResponseEntityExceptionHandler() {
  /**
   * Convert JPA EntityNotFoundException to a 404.
   */
  @ExceptionHandler(EntityNotFoundException::class)
  fun handleEntityNotFound(ex: EntityNotFoundException): ResponseEntity<Any> {
    val apiError =
      ApiError(
        status = HttpStatus.NOT_FOUND,
        message = ex.message,
      )
    return ResponseEntity(apiError, apiError.status)
  }

  /**
   * Override JSON parsing error message
   */
  override fun handleHttpMessageNotReadable(
    ex: HttpMessageNotReadableException,
    headers: HttpHeaders,
    status: HttpStatusCode,
    request: WebRequest,
  ): ResponseEntity<Any>? {
    val apiError =
      ApiError(
        status = HttpStatus.BAD_REQUEST,
        message = ex.message,
        ex = ex,
      )
    return ResponseEntity(apiError, apiError.status)
  }
}
