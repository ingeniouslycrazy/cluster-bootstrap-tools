ifeq ($(OS), Windows_NT)
	COMPOSE_CFG=docker-compose-win.yml
else
	COMPOSE_CFG=docker-compose.yml
endif

all: bake

bake:
	@docker buildx bake --file bake.hcl clt

run:
	@docker compose run --rm clt