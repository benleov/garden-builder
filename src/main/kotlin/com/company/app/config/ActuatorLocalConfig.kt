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

// import org.springframework.boot.actuate.autoconfigure.security.servlet.EndpointRequest
// import org.springframework.context.annotation.Configuration
// import org.springframework.context.annotation.Profile
// import org.springframework.security.config.annotation.web.builders.HttpSecurity
// import org.springframework.security.conf
// ig.annotation.web.configuration.EnableWebSecurity
// import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
// @Configuration
// @EnableWebSecurity
// @Profile("!deploy")
// class ActuatorLocalConfig : WebSecurityConfigurerAdapter() {
//   override fun configure(http: HttpSecurity) {
//     http
//       .csrf()
//       .disable()
//       .authorizeRequests()
//       .requestMatchers(EndpointRequest.toAnyEndpoint()).permitAll()
//       .antMatchers("/**").permitAll()
//       .and()
//       .httpBasic()
//   }
// }

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
@Profile("!deploy")
class ActuatorLocalConfig {
  @Bean
  fun configure(http: HttpSecurity): DefaultSecurityFilterChain {
    http
      .csrf { csrf -> csrf.disable() }
      .authorizeHttpRequests { authorizeHttpRequests ->
        authorizeHttpRequests
          .requestMatchers(EndpointRequest.toAnyEndpoint()).permitAll()
          .requestMatchers("/**").permitAll()
      }
      .httpBasic(Customizer.withDefaults())

    return http.build()
  }
}
