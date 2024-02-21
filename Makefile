run-postgres:
	docker run -d --rm --name pg -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -e PGDATA=/var/lib/postgresql/data/pgdata -v pg_data:/var/lib/postgresql/data -p 5432:5432 postgres:latest

create-db:
	docker exec -it pg createdb --username=root --owner=root liquibase_db

create-schema:
	docker exec -it pg psql --username=root --dbname=liquibase_db --command="CREATE SCHEMA liquibase_db;"

migrate-up:
	cd src/main/resources/ && \
	liquibase --changeLogFile=db/changelog/db.changelog.yaml --url="jdbc:postgresql://localhost:5432/liquibase_db?currentSchema=liquibase_db" --username=root --password=root update

migrate-rollback:
	cd src/main/resources/ && \
	liquibase --changeLogFile=db/changelog/db.changelog.yaml --url="jdbc:postgresql://localhost:5432/liquibase_db?currentSchema=liquibase_db" --username=root --password=root rollbackCount 1

migrate-status:
	cd src/main/resources/ && \
	liquibase status --changelog-file=db/changelog/db.changelog.yaml --url="jdbc:postgresql://localhost:5432/liquibase_db?currentSchema=liquibase_db" --username=root --password=root
