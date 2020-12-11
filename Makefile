## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

current_dir = $(shell pwd)

setup:
	# Create python virtualenv & source it
	python3 -m venv $(current_dir)/.devops &&\
	. $(current_dir)/.devops/bin/activate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	docker run --rm -i hadolint/hadolint < Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	. $(current_dir)/.devops/bin/activate
	pip install pylint
	pylint --disable=R,C,W1203 app.py

all: install lint test
