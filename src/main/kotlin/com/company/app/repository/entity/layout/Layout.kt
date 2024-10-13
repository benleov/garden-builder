package com.company.app.repository.entity.layout

import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.OneToMany
import org.hibernate.annotations.UuidGenerator

@Entity
data class Layout(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
  var name: String? = null,
  @OneToMany(cascade = [CascadeType.ALL])
  val beds: List<Bed>? = emptyList(),
)
