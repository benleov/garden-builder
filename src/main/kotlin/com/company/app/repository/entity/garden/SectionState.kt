package com.company.app.repository.entity.garden

import com.company.app.repository.entity.layout.Section
import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.ManyToOne
import jakarta.persistence.OneToMany
import org.hibernate.annotations.Cascade
import org.hibernate.annotations.UuidGenerator

@Entity
data class SectionState(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
  /**
   * Do not delete section if section state is deleted, as this belongs to the layout
   */
  @ManyToOne
  var section: Section? = null,
  @Cascade
  @OneToMany(cascade = [CascadeType.ALL])
  var snapshots: MutableList<SectionSnapshot>? = null,
)
