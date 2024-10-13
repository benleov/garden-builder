package com.company.app.util

import com.github.fge.jackson.JsonLoader
import com.github.fge.jsonschema.core.report.ProcessingReport
import com.github.fge.jsonschema.main.JsonSchema
import com.github.fge.jsonschema.main.JsonSchemaFactory
import org.assertj.core.api.Assertions.assertThat
import org.springframework.test.web.servlet.MvcResult
import org.springframework.test.web.servlet.ResultMatcher

class JsonSchemaMatcher {
  fun matchesSchema(schema: String): ResultMatcher =
    ResultMatcher { result: MvcResult ->
      val jsonSchema: JsonSchema = getJsonSchema(schema)
      val content = result.response.contentAsString
      val report: ProcessingReport = jsonSchema.validate(JsonLoader.fromString(content))
      assertThat(report.isSuccess).isTrue()
    }

  @Throws(Exception::class)
  private fun getJsonSchema(schema: String) =
    JsonSchemaFactory.byDefault().getJsonSchema(JsonLoader.fromResource(schema))

  companion object {
    fun jsonContent() = JsonSchemaMatcher()
  }
}
