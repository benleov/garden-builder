package com.company.app.repository.entity.garden

import com.company.app.repository.entity.layout.Layout
import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.Id
import jakarta.persistence.ManyToOne
import jakarta.persistence.OneToMany
import org.hibernate.annotations.UuidGenerator

@Entity
data class Garden(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
  var name: String? = null,
  var year: Int? = null,
  @ManyToOne
  val layout: Layout? = null,
  @Enumerated(EnumType.STRING)
  val season: Season? = null,
  @OneToMany(cascade = [CascadeType.ALL])
  var sectionStates: MutableList<SectionState>? = null,
  @OneToMany(cascade = [CascadeType.ALL])
  var sectionGroups: MutableList<SectionGroup>? = null,
)
