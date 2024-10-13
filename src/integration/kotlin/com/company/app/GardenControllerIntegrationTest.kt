package com.company.app

import com.company.app.controller.DTOGarden
import com.company.app.controller.GardenController
import com.company.app.repository.entity.garden.Garden
import com.company.app.repository.entity.garden.Season
import com.company.app.repository.entity.garden.SectionState
import com.company.app.repository.entity.layout.Layout
import com.company.app.util.JsonSchemaMatcher.Companion.jsonContent
import com.fasterxml.jackson.databind.ObjectMapper
import org.junit.jupiter.api.Test
import org.mockito.Mockito
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest
import org.springframework.boot.test.mock.mockito.MockBean
import org.springframework.http.MediaType
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get
import org.springframework.test.web.servlet.result.MockMvcResultHandlers.print
import org.springframework.test.web.servlet.result.MockMvcResultMatchers.status

/**
 * Integration testing is verifying that the controller's response matches the expected garden schema.
 */
@WebMvcTest(GardenController::class)
@AutoConfigureMockMvc(addFilters = false)
class GardenControllerIntegrationTest {
  companion object {
    private const val GARDEN_ID = "6dfa6661-9501-49f5-9260-35e1e15052b7"
    private const val LAYOUT_ID = "facd81f6-1d35-4f00-be84-7ea3079d1abf"
    private const val SECTION_STATE_ID = "b072ac28-cfce-42c5-acbc-c3f2a3c09977"
  }

  @Autowired
  private lateinit var mvc: MockMvc

  @Autowired
  private lateinit var objectMapper: ObjectMapper

  @MockBean
  private lateinit var gardenController: GardenController

  @Test
  fun testGetGardenReturnsValidResponse() {
    val garden =
      Garden(
        GARDEN_ID,
        "name",
        2022,
        Layout(LAYOUT_ID, "name", listOf()),
        Season.AUTUMN,
        sectionStates =
          mutableListOf(
            SectionState(
              SECTION_STATE_ID,
            ),
          ),
      )

    Mockito
      .`when`(gardenController.getGarden(GARDEN_ID))
      .thenReturn(
        DTOGarden.fromEntity(garden),
      )

    mvc
      .perform(
        get("/api/gardens/$GARDEN_ID")
          .contentType(MediaType.APPLICATION_JSON)
          .content(objectMapper.writeValueAsString(garden)),
      ).andDo(print())
      .andExpect(status().isOk)
      .andExpect(jsonContent().matchesSchema("/schemas/garden.json"))
  }
}
