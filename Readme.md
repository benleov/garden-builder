# Garden builder backend

This project provides the backend to the garden-builder project. It is a standard Kotlin Spring application, and requires
an SQL database to run.

## Prerequisites

- Docker (if running server or prerequisites in a container)
- Java (JDK 17+)

## Quickstart

### Using Docker

```
docker-compose up --build

# bootstrap data (optional)
cd bootstrap
./restore_seed.sh
```

### Using Gradle (Requires Java)

```
# start an sql container
docker compose -f docker-compose-db-only.yml up 

# bootstrap data (optional)
cd bootstrap
./restore_seed.sh

# run the application
./gradlew bootrun
```

## General project layout

- src/main contains main application
- src/integration contains integration tests
- src/test contains unit tests

## Building

To build the project run

```
./gradlew build
```

## Running

This project can be run locally via Gradle, or within a docker container. 

### Locally via Gradle

The application depends on an SQL database to be running to start correctly, which is explained in the 
[Dependencies](#dependencies) section below.

```
./gradlew bootrun
```

### Locally via Docker

The application can be built and run, along with a database, using Docker with Docker Compose. 

```
docker-compose up --build
```

To connect to a local database not running in docker, change the database host in application.yml in the 
docker-local profile to

```
host.docker.internal
```

Note that the mysql database will still start but will not be used. 

Finally, to run the application with the boot jar created by Gradle use the ``` Dockerfile-runtime ``` container.

## Dependencies

### MySQL - macOS 

```
brew install mysql
brew services start mysql
mysql_secure_installation
mysql -u<<username>> -p<<password>> -c 'CREATE DATABASE garden_service;'
```

### MySQL - Docker

```
docker compose -f docker-compose-db-only.yml up 
```

## Static code analysis

- https://detekt.dev/configurations.html

```
./gradlew detekt
```

```
A JSON Schema for the config file is available on: json.schemastore.org/detekt.

You can configure your IDE (e.g. IntelliJ or Android Studio have built-in support) to use that schema to give you 
autocompletion capabilities on your config file. More details on the IntelliJ support are available on this page.
```

## Linting

Linting is provided by [klint](https://pinterest.github.io/ktlint/latest/).

Configuration is stored in `.editorconfig`

Rules can be disabled using the `@Suppress` annotation.

```kotlin
// Suppress for a whole file
@file:Suppress(
  "PropertyName",
)

// or against individual lines

Suppress("PropertyName")
protected const val ContentType = "Content-Type"
```

To report errors run:

```
./gradlew ktlintCheck
```

To fix linting errors run:

```
./gradlew ktlintFormat
```

## Tests

```
./gradlew test
```

### Integration testing

- Integration tests are stored in src/integration.
- Controllers responses are verified they match the schemas in /resources/schemas

## OpenApi 3 / Swagger Documentation

- The Swagger UI page is available at http://localhost:8084/swagger-ui/index.html
- The OpenAPI description is available at the following url in json format: http://localhost:8084/v3/api-docs

## App configuration

### Cors / CSRF configuration

Cors is disabled for local development in `kotlin/com/company/app/config/WebMvcConfig.kt`
CSRF is disabled for local development in `kotlin/com/company/app/config/ActuatorLocalConfig.kt`

## Publishing/Deployment

https://github.com/springdoc/springdoc-openapi

## Dependabot 

## Features

- Represent and store a garden layout (Layout)
- Store historical garden planting configuration per season (Garden)
- Store when things were planted (SectionState)

## Model

- 'layout' - represents the plantable area of a garden
- 'garden' - the instance of a set of plants being planted in a garden. this needs to be tracked over time for a season

Note that all entities need to have optional parameters in order to have a default constructor

## GrowStuff API

Manually imported from:
```
homebrew install swagger-codegen 
swagger-codegen generate -i https://www.growstuff.org/api-docs/v1/swagger.json -l kotlin-client -o ./growstuff
```

However, the generated code failed for multiple reasons, and has mostly been rewritten.

## Example SQL

```sql
--- Get a list of sections for a layout

select * from layout
  left join layout_beds on layout.id = layout_beds.layout_id
  left join bed_rows on layout_beds.beds_id = bed_rows.bed_id
  left join row_sections on bed_rows.rows_id = row_sections.row_id
  where layout.name = 'Test1'
```
