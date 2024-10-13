package com.company.app.repository

import com.company.app.repository.entity.garden.SectionState
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface SectionStateRepository : JpaRepository<SectionState, String> {
  fun findBySectionId(sectionId: String): List<SectionState>
}
