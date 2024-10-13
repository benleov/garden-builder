package com.company.app.repository

import com.company.app.repository.entity.layout.Layout
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface LayoutRepository : JpaRepository<Layout, String>
