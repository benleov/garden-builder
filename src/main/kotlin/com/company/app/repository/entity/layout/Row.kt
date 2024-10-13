package com.company.app.repository.entity.layout

import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.OneToMany
import org.hibernate.annotations.UuidGenerator

/** row is a reserved keyword */
@Entity(name = "layout_row")
data class Row(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
  @OneToMany(cascade = [CascadeType.ALL])
  val sections: List<Section>? = emptyList(),
)
