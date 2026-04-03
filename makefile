# This ensures that we can call `make <target>` even if `<target>` exists as a file or
# directory.
.PHONY: help

# Exports all variables defined in the makefile available to scripts
.EXPORT_ALL_VARIABLES:

# Create .env file if it does not already exist
ifeq (,$(wildcard .env))
  $(shell touch .env)
endif

# Includes environment variables from the .env file
include .env

# Set gRPC environment variables, which prevents some errors with the `grpcio` package
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

# Set the PATH env var used by cargo and uv
export PATH := ${HOME}/.local/bin:${HOME}/.cargo/bin:$(PATH)

# Set the shell to bash, enabling the use of `source` statements
SHELL := /bin/bash

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	@echo "Installing the 'EuroEval' project..."
	@$(MAKE) --quiet install-uv
	@$(MAKE) --quiet install-dependencies
	@$(MAKE) --quiet install-pre-commit
	@echo "Installed the 'EuroEval' project."

install-uv:
	@if [ "$(shell which uv)" = "" ]; then \
		if [ "$(shell which rustup)" = "" ]; then \
			curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y; \
			echo "Installed Rust."; \
		fi; \
		curl -LsSf https://astral.sh/uv/install.sh | sh; \
		echo "Installed uv."; \
    else \
		echo "Updating uv..."; \
		uv self update || true; \
	fi

install-dependencies:
	@uv python install 3.12
	@uv sync --all-extras --all-groups --python 3.12

install-pre-commit:
	@uv run pre-commit install
	@uv run pre-commit autoupdate

check:  ## Lint, format, and type-check the code
	@git add . && uv run pre-commit run --all-files

bump-major:
	@uv run versioning.py --major
	@echo "Bumped major version!"

bump-minor:
	@uv run versioning.py --minor
	@echo "Bumped minor version!"

bump-patch:
	@uv run versioning.py --patch
	@echo "Bumped patch version!"
