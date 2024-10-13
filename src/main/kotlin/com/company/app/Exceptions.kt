/**
 * Ignoring this until more exceptions are added here.
 */
@file:Suppress("MatchingDeclarationName")

package com.company.app

import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.ResponseStatus

@ResponseStatus(value = HttpStatus.NOT_FOUND)
class EntityNotFoundException(override val message: String) : RuntimeException(message)

class InvalidRequestException(override val message: String) : RuntimeException(message)
