.DEFAULT_GOAL := help

### PRODUCTION
# ¯¯¯¯¯¯¯¯¯¯¯¯

install: ## Install monod dependencies
	(cd infra/prod; docker-compose run --rm app bash -c "npm install")

up: build ## Up monod
	(cd infra/prod; docker-compose up -d)

build: ## Build containers
	(cd infra/prod; docker-compose build --pull)

down: ## Down containers
	(cd infra/prod; docker-compose down)

bash: ## Run simple bash
	(cd infra/prod; docker-compose run --rm app bash)

rbash: ## Run simple bash as root
	(cd infra/prod; docker-compose run -u root --rm app bash)

### OTHERS
# ¯¯¯¯¯¯¯¯

.PHONY: help
help: ## Dislay this help
	@IFS=$$'\n'; for line in `grep -E '^[a-zA-Z_#-]+:?.*?## .*$$' $(MAKEFILE_LIST)`; do if [ "$${line:0:2}" = "##" ]; then \
	echo $$line | awk 'BEGIN {FS = "## "}; {printf "\n\033[33m%s\033[0m\n", $$2}'; else \
	echo $$line | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'; fi; \
	done; unset IFS;
