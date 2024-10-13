package com.company.app.repository

import com.company.app.repository.entity.plant.Plant
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface PlantRepository : JpaRepository<Plant, String>
