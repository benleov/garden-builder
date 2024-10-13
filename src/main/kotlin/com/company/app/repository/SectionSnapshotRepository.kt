package com.company.app.repository

import com.company.app.repository.entity.garden.SectionSnapshot
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface SectionSnapshotRepository : JpaRepository<SectionSnapshot, String>
