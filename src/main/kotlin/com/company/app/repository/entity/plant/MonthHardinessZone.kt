package com.company.app.repository.entity.plant

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.Id
import org.hibernate.annotations.UuidGenerator
import java.time.Month

@Entity
data class MonthHardinessZone(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
  @Enumerated(EnumType.STRING)
  val month: Month? = null,
  @Enumerated(EnumType.STRING)
  val hardinessZone: HardinessZone? = null,
)
