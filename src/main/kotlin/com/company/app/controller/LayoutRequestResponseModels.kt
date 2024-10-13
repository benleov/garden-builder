package com.company.app.controller

import com.company.app.repository.entity.layout.Bed
import com.company.app.repository.entity.layout.Layout
import com.company.app.repository.entity.layout.Row
import com.company.app.repository.entity.layout.Section

data class DTOLayout(
  val id: String? = null,
  val name: String? = null,
  val beds: List<DTOBed>,
) {
  companion object {
    fun fromEntity(layout: Layout): DTOLayout {
      return DTOLayout(
        id = layout.id,
        name = layout.name,
        beds = layout.beds?.map { DTOBed.fromEntity(it) } ?: listOf(),
      )
    }

    fun toEntity(garden: DTOLayout): Layout {
      return Layout(
        id = garden.id,
        name = garden.name,
        beds = garden.beds.map { DTOBed.toEntity(it) },
      )
    }
  }
}

data class DTOBed(
  val id: String? = null,
  val name: String? = null,
  val rows: List<DTORow>,
) {
  companion object {
    fun fromEntity(bed: Bed): DTOBed {
      return DTOBed(
        id = bed.id,
        name = bed.name,
        rows = (bed.rows?.map { DTORow.fromEntity(it) }) ?: emptyList(),
      )
    }

    fun toEntity(bed: DTOBed): Bed {
      return Bed(
        id = bed.id,
        name = bed.name,
        rows = bed.rows.map { DTORow.toEntity(it) },
      )
    }
  }
}

data class DTORow(
  val id: String? = null,
  val sections: List<DTOSection>,
) {
  companion object {
    fun fromEntity(row: Row): DTORow {
      return DTORow(
        id = row.id,
        sections = row.sections?.map { DTOSection.fromEntity(it) } ?: emptyList(),
      )
    }

    fun toEntity(row: DTORow): Row {
      return Row(
        id = row.id,
        sections = row.sections.map { DTOSection.toEntity(it) },
      )
    }
  }
}

data class DTOSection(val id: String? = null) {
  companion object {
    fun fromEntity(section: Section): DTOSection {
      return DTOSection(
        id = section.id,
      )
    }

    fun toEntity(section: DTOSection): Section {
      return Section(
        id = section.id,
      )
    }
  }
}
