package com.company.app.service

import com.company.app.repository.SectionStateRepository
import com.company.app.repository.entity.garden.SectionState
import org.springframework.stereotype.Service

@Service
class SectionStateService(private val sectionStateRepository: SectionStateRepository) {
  fun getSectionStateBySectionId(sectionId: String): List<SectionState> {
    return sectionStateRepository.findBySectionId(sectionId)
  }
}
