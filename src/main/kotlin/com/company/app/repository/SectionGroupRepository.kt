package com.company.app.repository

import com.company.app.repository.entity.garden.SectionGroup
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface SectionGroupRepository : JpaRepository<SectionGroup, String>
