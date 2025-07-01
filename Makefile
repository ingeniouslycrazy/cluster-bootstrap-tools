ifeq ($(OS), Windows_NT)
	COMPOSE_CFG=docker-compose-win.yml
else
	COMPOSE_CFG=docker-compose.yml
endif

all: init bake run

init:
	@bash -l init.sh
bake:
	@docker buildx bake clt
run:
	@docker compose -f ${COMPOSE_CFG} run --rm clt