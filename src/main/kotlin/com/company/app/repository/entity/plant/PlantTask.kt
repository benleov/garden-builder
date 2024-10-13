package com.company.app.repository.entity.plant

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.Id
import org.hibernate.annotations.UuidGenerator
import java.time.Duration

@Entity
data class PlantTask(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
  @Enumerated(EnumType.STRING)
  val type: PlantTaskType? = null,
  val startOffset: Duration? = null,
)
