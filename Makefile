format:
	@echo "Running black formatter..."
	@poetry run black src/backend
	@poetry run black scripts/
	@echo "Running isort formatter..."
	@poetry run isort src/backend
	@poetry run isort scripts/

lint:
	@echo "Running flake8 linter..."
	@poetry run flake8 src/backend --max-line-length=89

test: # needed?
	@echo "Running pytest..."
	@poetry run pytest tests --color=yes

docs:
	@poetry run mkdocs build

docs-deploy:
	@poetry run mkdocs gh-deploy

run-dev:
	@poetry run uvicorn api.main:app --reload