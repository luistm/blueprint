dev-setup: ## Installs project dependencies
	poetry install --no-root
	poetry run pre-commit install

test: ## Runs all the tests
	poetry run pytest .

build:  ## Builds this project into a package
	poetry build

export-requirements: ## Exports requirements to a requirements.txt file
	poetry export --without-hashes --format=requirements.txt > requirements.txt


clean: ## Resets the development environment to the post clone repository state
	-rm requirements.txt
	-rm dist/cake*
	-poetry env remove python --quiet

all: clean dev-setup build export-requirements test