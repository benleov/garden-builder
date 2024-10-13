@file:Suppress("TooManyFunctions")

package com.company.app.controller

import com.amazonaws.xray.spring.aop.XRayEnabled
import com.company.app.service.GardenService
import org.springframework.format.annotation.DateTimeFormat
import org.springframework.util.MimeTypeUtils
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PatchMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.time.Instant

@RestController
@RequestMapping("/api/gardens")
@XRayEnabled
@CrossOrigin
class GardenController(
  private val gardenService: GardenService,
) {
  @PostMapping(
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun createGarden(
    @RequestBody request: DTOGarden,
  ): DTOGarden {
    return DTOGarden.fromEntity(
      gardenService.saveGarden(request),
    )
  }

  @DeleteMapping(
    path = ["/{gardenId}"],
  )
  fun deleteGarden(
    @PathVariable(name = "gardenId") gardenId: String,
  ) {
    return gardenService.deleteGarden(gardenId)
  }

  /**
   * Retrieves a section state
   */
  @GetMapping(
    path = ["/{gardenId}/section-state/{sectionStateId}"],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun getSectionState(
    @PathVariable(name = "gardenId") gardenId: String,
    @PathVariable(name = "sectionStateId") sectionStateId: String,
  ): DTOSectionState {
    return DTOSectionState.fromEntity(gardenService.getSectionStateById(gardenId, sectionStateId))
  }

  /**
   * Create a new section state for a section
   */
  @PostMapping(
    path = ["/{gardenId}/section-state"],
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun createSectionState(
    @PathVariable(name = "gardenId") gardenId: String,
    @RequestBody request: DTOSectionState,
  ): DTOSectionState {
    return DTOSectionState.fromEntity(gardenService.createSectionState(gardenId, request))
  }

  /**
   * Create a new section state (bulk)
   */
  @PostMapping(
    path = ["/{gardenId}/section-states"],
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun createSectionStates(
    @PathVariable(name = "gardenId") gardenId: String,
    @RequestBody request: List<DTOSectionState>,
  ): List<DTOSectionState> {
    return gardenService.createSectionStates(gardenId, request).map { DTOSectionState.fromEntity(it) }
  }

  /**
   * Update a section state
   */
  @PutMapping(
    path = ["/{gardenId}/section-state/{sectionStateId}"],
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun updateSectionState(
    @PathVariable(name = "gardenId") gardenId: String,
    @PathVariable(name = "sectionStateId") sectionStateId: String,
    @RequestBody request: DTOSectionState,
  ): DTOSectionState {
    return DTOSectionState.fromEntity(gardenService.updateSectionState(gardenId, sectionStateId, request))
  }

  /**
   * Update a list of section states (bulk) - PARTIAL.
   */
  @PatchMapping(
    path = ["/{gardenId}/section-states"],
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun updateSectionStates(
    @PathVariable(name = "gardenId") gardenId: String,
    @RequestBody request: List<DTOSectionState>,
  ): List<DTOSectionState> {
    return gardenService.patchSectionStates(gardenId, request).map { DTOSectionState.fromEntity(it) }
  }

  /**
   * Delete section state for a section (including all snapshots)
   */
  @DeleteMapping(
    path = ["/{gardenId}/section-state/{sectionStateId}"],
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun deleteSectionState(
    @PathVariable(name = "gardenId") gardenId: String,
    @PathVariable(name = "sectionStateId") sectionStateId: String,
  ) {
    return gardenService.deleteSectionState(gardenId, sectionStateId)
  }

  /**
   * update a single sections states snapshot
   */
  @PutMapping(
    path = ["/{gardenId}/section-state/{sectionStateId}/section-snapshot/{sectionSnapshotId}"],
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  @Suppress("UnusedPrivateMember")
  fun updateSectionStateSnapshot(
    @PathVariable(name = "gardenId") gardenId: String,
    @PathVariable(name = "sectionStateId") sectionStateId: String,
    @PathVariable(name = "sectionSnapshotId") sectionSnapshotId: String,
    @RequestBody request: DTOSectionSnapshot,
  ): DTOSectionSnapshot {
    return DTOSectionSnapshot.fromEntity(
      gardenService.updateSectionStateSnapshot(gardenId, sectionSnapshotId, request),
    )
  }

  /**
   * Add a single snapshot to a section state
   */
  @PostMapping(
    path = ["/{gardenId}/section-state/{sectionStateId}/section-snapshot"],
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun updateSectionSnapshot(
    @PathVariable(name = "gardenId") gardenId: String,
    @PathVariable(name = "sectionStateId") sectionStateId: String,
    @RequestBody request: DTOSectionSnapshot,
  ): DTOSectionSnapshot {
    return DTOSectionSnapshot.fromEntity(gardenService.createSectionStateSnapshot(gardenId, sectionStateId, request))
  }

  /**
   * Delete a single snapshot from a section state
   */
  @DeleteMapping(
    path = ["/{gardenId}/section-state/{sectionStateId}/section-snapshot/{sectionSnapshotId}"],
  )
  fun deleteSectionSnapshot(
    @PathVariable(name = "gardenId") gardenId: String,
    @PathVariable(name = "sectionStateId") sectionStateId: String,
    @PathVariable(name = "sectionSnapshotId") sectionSnapshotId: String,
  ) = gardenService.deleteSectionSnapshot(gardenId, sectionStateId, sectionSnapshotId)

  /**
   * Get garden by id
   */
  @GetMapping(path = ["/{gardenId}"], produces = [MimeTypeUtils.APPLICATION_JSON_VALUE])
  fun getGarden(
    @PathVariable(name = "gardenId") gardenId: String,
  ): DTOGarden {
    return DTOGarden.fromEntity(
      gardenService.getGardenById(gardenId),
    )
  }

  @PostMapping(
    path = ["/{gardenId}/section-group"],
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun createSectionGroup(
    @PathVariable(name = "gardenId") gardenId: String,
    @RequestBody request: DTOSectionGroup,
  ): DTOSectionGroup {
    return DTOSectionGroup.fromEntity(
      gardenService.saveSectionGroup(null, gardenId, request),
    )
  }

  @PutMapping(
    path = ["/{gardenId}/section-group/{sectionGroupId}"],
    consumes = [MimeTypeUtils.APPLICATION_JSON_VALUE],
    produces = [MimeTypeUtils.APPLICATION_JSON_VALUE],
  )
  fun updateSectionGroup(
    @PathVariable(name = "gardenId") gardenId: String,
    @PathVariable(name = "sectionGroupId") sectionGroupId: String,
    @RequestBody request: DTOSectionGroup,
  ): DTOSectionGroup {
    return DTOSectionGroup.fromEntity(
      gardenService.saveSectionGroup(sectionGroupId, gardenId, request),
    )
  }

  @GetMapping(path = ["/"], produces = [MimeTypeUtils.APPLICATION_JSON_VALUE])
  fun getAllGardens(
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    @RequestParam(name = "plantedBefore") plantedBefore: Instant?,
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    @RequestParam(name = "harvestedBefore") harvestedBefore: Instant?,
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    @RequestParam(name = "harvestedAfter") harvestedAfter: Instant?,
  ): List<DTOGarden> {
    return gardenService.getAllGardens(plantedBefore, harvestedBefore, harvestedAfter).map { DTOGarden.fromEntity(it) }
  }
}
