build:
	docker compose build

run:
	docker compose run --rm nvim

shell:
	docker compose run --rm nvim sh

test:
	docker compose run --rm nvim sh -c "nvim --headless -c 'luafile lua/utils_spec.lua"

help:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
