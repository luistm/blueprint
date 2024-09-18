.DEFAULT_GOAL := help
.PHONY: all

PROJECT_NAME=$(shell grep "name" pyproject.toml | cut -d "\"" -f 2)

# Misc --------------------------------------------------------------------------------------------

all: clean setup check tests future

help:
	@# Got it from here: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; \
	{printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Cleanup -----------------------------------------------------------------------------------------

clean: ## Resets the development environment to the initial state
	-find . -name "*.pyc" -delete
	find . -type d -name '__pycache__' -exec rm -r {} +
	-rm requirements.txt
	-rm dist/${PROJECT_NAME}*
	-poetry env remove --quiet --all
	-rm -rf build
	-rm -rf .mypy_cache
	-rm -rf .nox
	-rm -rf .pytest_cache
	-rm -r .coverage
	-rm -r htmlcov

# Dependency Management ---------------------------------------------------------------------------

deps: ## Installs project dependencies
	poetry install --no-root

deps-outdated: ## Shows outdated dependencies
	poetry show --outdated

update-latest: ## Update dependencies to latest available compatible versions
	poetry up --pinned --latest

deps-update-and-commit:  update-latest ## Update and commit dependencies
	git add .
	git commit -m "Update  dependencies to latest available compatible versions"

# Configuration -----------------------------------------------------------------------------------

setup: deps ## Sets up the development environment
	poetry run pre-commit install

# Static checks -----------------------------------------------------------------------------------

check: ## Runs static checks on the code
	poetry run pre-commit run --all

# Tests -------------------------------------------------------------------------------------------

unit-tests: ## Runs the unit tests
	poetry run pytest ./src  -svv -m "not integration"

integration-tests: ## Runs the integration tests
	poetry run pytest ./src  -svv -m "integration"

acceptance-tests: ## Runs the acceptance tests
	poetry run pytest ./tests  -svv
	
tests: unit-tests integration-tests acceptance-tests  ## Runs all the tests

coverage: ## Shows coverage in the browser
	poetry run coverage run -m pytest .
	poetry run coverage html
	open htmlcov/index.html

future: ## Tests the code against multiple python versions
	poetry export -f requirements.txt --output requirements.txt --with dev
	poetry run nox
	-rm requirements.txt

# Packaging ---------------------------------------------------------------------------------------

build:  ## Builds this project into a package
	poetry build

$(PROJECT_NAME):
	@echo "Running $(PROJECT_NAME) in development mode"
	poetry install
	poetry run $(PROJECT_NAME)

