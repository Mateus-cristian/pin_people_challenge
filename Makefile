.PHONY: up down build logs bash db-setup db-reset test

compose-up:
	docker compose -p pin -f infra/compose.yml up -d

compose-down:
	docker compose -p pin -f infra/compose.yml down

compose-build:
	docker compose -p pin -f infra/compose.yml build

compose-logs:
	docker compose -p pin -f infra/compose.yml logs -f

compose-bash:
	docker compose -p pin -f infra/compose.yml exec web bash

db-setup:
	docker compose -p pin -f infra/compose.yml run --rm web rails db:setup

db-reset:
	docker compose -p pin -f infra/compose.yml run --rm web rails db:reset

test:
	docker compose -p pin -f infra/compose.yml run --rm web rails test

db-migrate:
	docker compose -p pin -f infra/compose.yml exec web bundle exec rails db:migrate

rubocop:
	docker exec -it pin-web-1 bundle exec rubocop -c infra/.rubocop.yml $(ARGS)
