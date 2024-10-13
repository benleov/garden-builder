package com.company.app.service

import com.company.app.controller.DTOLayout
import com.company.app.repository.LayoutRepository
import com.company.app.repository.entity.layout.Layout
import org.springframework.stereotype.Service

@Service
class LayoutService(private val layoutRepository: LayoutRepository) {
  fun deleteLayout(id: String) = layoutRepository.deleteById(id)

  fun getLayoutById(id: String): Layout = layoutRepository.getReferenceById(id)

  fun saveLayout(request: DTOLayout): Layout = layoutRepository.save(DTOLayout.toEntity(request))

  fun getAllLayouts(): List<Layout> = layoutRepository.findAll()
}
