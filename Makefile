.DEFAULT_GOAL := help
.PHONY: all

PROJECT_NAME=$(shell grep "name" pyproject.toml | cut -d "\"" -f 2)

help:
	@# Got it from here: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

deps: ## Installs project dependencies
	poetry install --no-root

deps-outdated: ## Shows outdated dependencies
	poetry show --outdated

clean: ## Resets the development environment to the initial state
	-find . -name "*.pyc" -delete
	-rm requirements.txt
	-rm dist/${PROJECT_NAME}*
	-poetry env remove python --quiet

setup: deps ## Sets up the developement environment
	poetry run pre-commit install

check:
	poetry run pre-commit run --all

test: ## Runs all the tests
	poetry run pytest .

build:  ## Builds this project into a package
	poetry build

all: clean setup check test build export-requirements deps-outdated