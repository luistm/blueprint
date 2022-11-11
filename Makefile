.DEFAULT_GOAL := help
.PHONY: all

help:
	# Got it from here: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

export-requirements: ## Exports requirements to a requirements.txt file
	poetry export --without-hashes --format=requirements.txt > requirements.txt

deps: ## Installs project dependencies
	poetry install --no-root

deps-outdated: ## Shows outdated dependencies
	poetry show --outdated

clean: ## Resets the development environment to the initial state
	-rm requirements.txt
	-rm dist/cake*
	-poetry env remove python --quiet

setup: deps ## Sets up the developement environment
	poetry run pre-commit install

build:  ## Builds this project into a package
	poetry build

test: ## Runs all the tests
	poetry run pytest .


all: clean setup build test export-requirements deps-outdated