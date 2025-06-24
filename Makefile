ifeq ($(OS), Windows_NT)
	COMPOSE_CFG=docker-compose-win.yml
else
	COMPOSE_CFG=docker-compose.yml
endif

all: bake

bake:
	@docker buildx bake base
	@docker buildx bake ansible terraform

caac:
	@docker compose --file ${COMPOSE_CFG} run --rm ansible

iaac:
	@docker compose --file ${COMPOSE_CFG} run --rm terraform