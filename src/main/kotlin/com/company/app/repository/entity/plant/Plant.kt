package com.company.app.repository.entity.plant

import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.Id
import jakarta.persistence.OneToMany
import org.hibernate.annotations.UuidGenerator

@Entity
data class Plant(
  @Id
  @UuidGenerator
  @Column(length = 36, unique = true)
  var id: String? = null,
  // common name
  val name: String? = null,
  // cultivar
  val variety: String? = null,
  @Enumerated(EnumType.STRING)
  val family: PlantFamily? = null,
  val species: String? = null,
  val emojiCodePoint: String? = null,
  val thumbnailUrl: String? = null,
  val fullSizeUrl: String? = null,
  val perennial: Boolean? = null,
  val medianDaysLifespan: Int? = null,
  val medianDaysToFirstHarvest: Int? = null,
  val medianDaysToLastHarvest: Int? = null,
  val heightRangeCm: Int? = null,
  val spacingCm: Int? = null,
  @Enumerated(EnumType.STRING)
  val position: PlantPosition? = null,
  val wateringLevel: Int? = null,
  @OneToMany(cascade = [CascadeType.ALL])
  val sowingMonthHardinessZones: MutableList<MonthHardinessZone>? = null,
  @OneToMany
  val companionPlants: List<Plant>? = null,
  @OneToMany(cascade = [CascadeType.ALL])
  val plantTasks: List<PlantTask>? = null,
)
