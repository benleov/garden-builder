package com.company.app.repository.entity.garden

import com.company.app.repository.entity.plant.Plant
import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.ManyToOne
import jakarta.persistence.OneToMany
import org.hibernate.annotations.UuidGenerator
import java.time.Instant

@Entity
data class SectionSnapshot(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
  @ManyToOne
  var plant: Plant? = null,
  var plantingTimestamp: Instant? = null,
  var harvestedTimestamp: Instant? = null,
  @OneToMany(cascade = [CascadeType.ALL])
  var sectionTreatments: List<SectionTreatment>? = null,
)
