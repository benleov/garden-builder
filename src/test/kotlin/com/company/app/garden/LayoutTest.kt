package com.company.app.garden

import com.company.app.repository.entity.layout.Layout
import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class LayoutTest {
  @Test
  fun test() {
    val layoutId = "1234-1234-1234-1234"
    val layout =
      Layout(
        id = layoutId,
        beds = listOf(),
      )
    assertThat(layout.id).isEqualTo(layoutId)
  }
}
