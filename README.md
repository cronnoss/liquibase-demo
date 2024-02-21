# liquibase-demo

## Description

This is a simple Spring Boot application that demonstrates how to use Liquibase for database migrations.

Tutorial. Liquibase migrations with Spring Boot and MySQL
https://www.youtube.com/watch?v=cc_QpEA97xE

## How to run

Run command to start the Postgres database in a Docker container:
`make run-postgres`

Then create the database:
`make create-db`

Then create the schema:
`make create-schema`

Then run the application.
`mvn spring-boot:run`