package com.company.app.repository.entity.garden

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.Id
import org.hibernate.annotations.UuidGenerator
import java.time.Instant

@Entity
data class SectionTreatment(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
  @Enumerated(EnumType.STRING)
  val treatmentType: TreatmentType? = null,
  var treatmentTimestamp: Instant? = null,
)
