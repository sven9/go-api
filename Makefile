.PHONY: build
build:
	docker compose build

.PHONY: up
up:
	docker compose up

.PHONY: shell
shell:
	docker exec -it go_api bash

.PHONY: down
down:
	docker compose down

.PHONY: lint
lint:
	docker exec go_api go fmt ./...

.PHONY: test
test:
	docker exec go_api go test sven9/go-api/go_api/...
