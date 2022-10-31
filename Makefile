dev-setup: ## Installs project dependencies
	poetry install --no-root
	poetry run pre-commit install

test: ## Runs all the tests
	poetry run pytest .

export-requirements: ## Exports requirements to a requirements.txt file
	poetry export --without-hashes --format=requirements.txt > requirements.txt


clean:
	-rm requirements.txt

all: clean dev-setup export-requirements test