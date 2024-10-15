import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
  id("org.springframework.boot") version "3.3.4" // https://spring.io/projects/spring-boot

  // A Gradle plugin that provides Maven-like dependency management functionality Based on the configured
  // dependency management, the plugin will control the versions of your project's direct and transitive
  // dependencies and will honour any exclusions declared in the poms of your project's dependencies and any
  // imported boms.

  id("io.spring.dependency-management") version "1.1.6"

  kotlin("jvm") version "2.0.10" // kotlin version

  // Kotlin Spring compiler plugin
  // https://plugins.gradle.org/plugin/org.jetbrains.kotlin.plugin.spring
  kotlin("plugin.spring") version "2.0.10"

  // Produce git.properties for spring-boot-actuator
  id("com.gorylenko.gradle-git-properties") version "2.4.2"

  application
  // https://github.com/JLLeitschuh/ktlint-gradle
  id("org.jlleitschuh.gradle.ktlint") version "12.1.1" // linting
  id("io.gitlab.arturbosch.detekt") version "1.23.7" // static code analysis
}

group = "com.company.service"
version = "1.0.0-SNAPSHOT"

repositories {
  mavenLocal()
  mavenCentral()
  maven(url = "https://plugins.gradle.org/m2/")
}

val awsXrayVersion = "2.15.3"
val awsSdkVersion = "1.12.730"
val springCloudVersion = "2023.0.1"
val fasterXmlVersion = "2.17.1"

dependencies {
  implementation("io.github.microutils:kotlin-logging:3.0.5") // wrapper for slf4j

  // spring
  implementation("org.springframework.boot:spring-boot-starter-actuator")
  implementation("org.springframework.boot:spring-boot-starter-aop")
  implementation("org.springframework.boot:spring-boot-starter-data-jpa")
  implementation("org.springframework.boot:spring-boot-starter-security")
  implementation("org.springframework.boot:spring-boot-starter-web")
  // allows hot reloading note that 'build project automatically' needs to be enabled for this to work
  developmentOnly("org.springframework.boot:spring-boot-devtools")

  // sql
  implementation("com.mysql:mysql-connector-j:8.4.0")
  implementation("com.zaxxer:HikariCP:6.0.0")
  implementation("org.flywaydb:flyway-core:10.13.0")
  implementation("org.flywaydb:flyway-mysql:10.13.0")

  implementation("org.apache.commons:commons-lang3:3.14.0")
  // jackson
  implementation("com.fasterxml.jackson.datatype:jackson-datatype-jsr310:$fasterXmlVersion")
  implementation("com.fasterxml.jackson.module:jackson-module-kotlin:$fasterXmlVersion")

  // aws
  implementation("com.amazonaws:aws-xray-recorder-sdk-core:$awsXrayVersion")
  implementation("com.amazonaws:aws-xray-recorder-sdk-apache-http:$awsXrayVersion")
  implementation("com.amazonaws:aws-xray-recorder-sdk-spring:$awsXrayVersion")
  implementation("com.amazonaws:aws-java-sdk-core:$awsSdkVersion")
  implementation("com.amazonaws:aws-java-sdk-sts:$awsSdkVersion")

  // swagger (open-api)
  implementation("org.springdoc:springdoc-openapi-starter-webmvc-ui:2.5.0")

  // growstuff api import from swagger-codegen
  implementation("com.squareup.moshi:moshi-kotlin:1.15.1")
  implementation("com.squareup.moshi:moshi-adapters:1.15.1")
  implementation("com.squareup.okhttp3:okhttp:4.12.0")

  // test
  testImplementation("org.junit.jupiter:junit-jupiter-engine:5.10.2")
  testImplementation("com.github.fge:json-schema-validator:2.2.6") // (integration test schema validation)
  testImplementation("org.mockito.kotlin:mockito-kotlin:5.3.1")
  testImplementation("org.springframework.boot:spring-boot-starter-test")
  testImplementation("org.hsqldb:hsqldb:2.7.2")
  testImplementation("org.assertj:assertj-core:3.26.3")
}

dependencyManagement {
  imports {
    mavenBom("org.springframework.cloud:spring-cloud-dependencies:$springCloudVersion")
  }
}

tasks.withType<Test> {
  useJUnitPlatform()
}

tasks.withType<KotlinCompile> {
//  kotlinOptions.jvmTarget = "1.8"
}

sourceSets {
  create("integration") {
    test
    compileClasspath += sourceSets.main.get().output.plus(sourceSets.test.get().output)
    runtimeClasspath += sourceSets.main.get().output.plus(sourceSets.test.get().output)
  }
}

val integrationImplementation: Configuration by configurations.getting {
  extendsFrom(configurations.implementation.get())
}

/**
 * Add dependencies to integration tests sources
 */
configurations {
  integrationImplementation.extendsFrom(testImplementation.get())
}

val integrationTest =
  task<Test>("integration") {
    description = "Runs integration tests."
    group = "verification"
    testClassesDirs = sourceSets["integration"].output.classesDirs
    classpath = sourceSets["integration"].runtimeClasspath
    shouldRunAfter("test")
  }

tasks.check { dependsOn(integrationTest) }

tasks.withType<ProcessResources> {
  filesMatching(listOf("application.yml", "bootstrap.properties")) {
    expand("projectName" to project.name, "projectVersion" to project.version)
  }
}
/**
 * Set the name of the boot jar to a static name, so it can be packaged more easily and disable the normal jar task.
 */
tasks.bootJar {
  this.archiveFileName.set("boot.jar")
}

tasks.jar { enabled = false }

/**
 * When building within a container git will not exist; don't fail in this case
 */
gitProperties {
  failOnNoGitDirectory = false
}

application {
  applicationDefaultJvmArgs = listOf("-Duser.timezone=UTC")
}
