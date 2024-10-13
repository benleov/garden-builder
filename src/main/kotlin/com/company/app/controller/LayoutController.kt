package com.company.app.controller

import com.amazonaws.xray.spring.aop.XRayEnabled
import com.company.app.service.LayoutService
import org.springframework.util.MimeTypeUtils
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/layouts")
@XRayEnabled
@CrossOrigin
class LayoutController(
  private val layoutService: LayoutService,
) {
  @PostMapping(consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE], produces = [MimeTypeUtils.APPLICATION_JSON_VALUE])
  fun saveLayout(
    @RequestBody request: DTOLayout,
  ): DTOLayout {
    return DTOLayout.fromEntity(
      layoutService.saveLayout(request),
    )
  }

  @GetMapping(path = ["/{layoutId}"], produces = [MimeTypeUtils.APPLICATION_JSON_VALUE])
  fun getLayoutById(
    @PathVariable(name = "layoutId") layoutId: String,
  ): DTOLayout {
    return DTOLayout.fromEntity(
      layoutService.getLayoutById(layoutId),
    )
  }

  @GetMapping(path = ["/"], produces = [MimeTypeUtils.APPLICATION_JSON_VALUE])
  fun getAllLayouts(): List<DTOLayout> {
    return layoutService.getAllLayouts().map { DTOLayout.fromEntity(it) }
  }

  @DeleteMapping(
    path = ["/{layoutId}"],
  )
  fun deleteGarden(
    @PathVariable(name = "layoutId") layoutId: String,
  ) {
    return layoutService.deleteLayout(layoutId)
  }
}
