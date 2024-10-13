package com.company.app.repository

import com.company.app.repository.entity.garden.Garden
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface GardenRepository : JpaRepository<Garden, String>
