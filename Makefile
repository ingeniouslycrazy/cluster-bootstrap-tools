all: bake

bake:
	@docker buildx bake --file ./bake.hcl

caac:
	@docker compose run --rm ansible

iaac:
	@docker compose run --rm terraform