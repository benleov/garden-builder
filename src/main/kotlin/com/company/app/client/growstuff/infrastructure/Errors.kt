@file:Suppress("unused")

package com.company.app.client.growstuff.infrastructure

open class ClientException : RuntimeException {
  /**
   * Constructs an [ClientException] with no detail message.
   */
  constructor() : super()

  /**
   * Constructs an [ClientException] with the specified detail message.
   * @param message the detail message.
   */
  constructor(message: String) : super(message)

  companion object {
    private const val serialVersionUID: Long = 123L
  }
}

open class ServerException : RuntimeException {
  /**
   * Constructs an [ServerException] with no detail message.
   */
  constructor() : super()

  /**
   * Constructs an [ServerException] with the specified detail message.
   * @param message the detail message.
   */
  constructor(message: String) : super(message)

  companion object {
    private const val serialVersionUID: Long = 456L
  }
}
