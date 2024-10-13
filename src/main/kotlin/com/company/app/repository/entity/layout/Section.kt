package com.company.app.repository.entity.layout

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.Id
import org.hibernate.annotations.UuidGenerator

/**
 * Represents a square in the garden in which one type of plant can be planted.
 */
@Entity
data class Section(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
)
