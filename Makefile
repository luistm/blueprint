test:
	poetry run pytest .

export-requirements:
	poetry export --without-hashes --format=requirements.txt > requirements.txt