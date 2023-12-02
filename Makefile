DT_NOW := $(shell date)

# VENV
venv.init:
	@$(info INFO | $(shell date) | Makefile → venv.init...)
	python3 -m venv venv
	. venv/bin/activate
	pip install --upgrade pip
	pip install poetry

# FORMATTING
format:
	@$(info INFO | $(shell date) | Makefile → Formatting...)
	poetry run black scripts
	poetry run isort scripts
	poetry run flake8 scripts

format-check:
	@$(info INFO | $(shell date) | Makefile → Format checking...)
	poetry run black --check scripts
	poetry run isort --chekc scripts
