package com.company.app.repository.entity.garden

import com.company.app.repository.entity.layout.Section
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.ManyToMany
import org.hibernate.annotations.UuidGenerator

@Entity
data class SectionGroup(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
  var name: String? = null,
  var colour: String? = null,
  @ManyToMany
  var sections: List<Section>? = null,
)
