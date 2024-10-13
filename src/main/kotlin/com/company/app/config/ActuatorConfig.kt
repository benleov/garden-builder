package com.company.app.config

import org.springframework.boot.actuate.autoconfigure.security.servlet.EndpointRequest
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Profile
import org.springframework.security.config.Customizer
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.web.DefaultSecurityFilterChain

// @Configuration
// @Profile("deploy")
// @Order(BASIC_AUTH_ORDER)
// class ActuatorConfig : WebSecurityConfigurerAdapter() {
//   override fun configure(http: HttpSecurity) {
//     http
//       .csrf()
//       .disable()
//       .authorizeRequests()
//       .requestMatchers(EndpointRequest.to("health", "flyway", "info"))
//       .permitAll()
//       .requestMatchers(EndpointRequest.toAnyEndpoint()).hasRole("ENDPOINT_ADMIN")
//       .and()
//       .httpBasic()
//   }
// }

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
@Profile("deploy")
class ActuatorConfig {
  @Bean
  fun configure(http: HttpSecurity): DefaultSecurityFilterChain {
    http
      .csrf { csrf -> csrf.disable() }
      .authorizeHttpRequests { authorizeHttpRequests ->
        authorizeHttpRequests
          .requestMatchers(EndpointRequest.to("health", "flyway", "info"))
          .permitAll()
          .requestMatchers(EndpointRequest.toAnyEndpoint())
          .hasRole("ENDPOINT_ADMIN")
      }
      .httpBasic(Customizer.withDefaults())

    return http.build()
  }
}
