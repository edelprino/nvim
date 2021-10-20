build:
	docker compose build

run:
	docker compose run --rm nvim

shell:
	docker compose run --rm nvim sh

test:
	docker compose run --rm nvim sh -c "nvim --headless -c 'luafile lua/utils_spec.lua"
