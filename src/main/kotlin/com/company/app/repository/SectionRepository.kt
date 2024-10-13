package com.company.app.repository

import com.company.app.repository.entity.layout.Section
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface SectionRepository : JpaRepository<Section, String>
