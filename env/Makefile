MODULES = gcc/11.2.0 openmpi/4.1.6-vfi4iwj python/3.11.7-qxgm323
VENV_DIR = ./dask_ray_workshop
REQ_FILE = requirements.txt

SHELL := /bin/bash

.PHONY: setup
setup: load-modules $(VENV_DIR)

$(VENV_DIR):
	@echo "Creating Python virtual environment in $(VENV_DIR)..."
	python -m venv $(VENV_DIR)

.PHONY: install
install: load-modules $(VENV_DIR) $(REQ_FILE)
	@echo "Activating virtual environment and installing dependencies..."
	source $(VENV_DIR)/bin/activate && \
	pip install -U pip wheel setuptools && \
	pip install --no-binary :all: --compile mpi4py && \
	pip install -r $(REQ_FILE)

.PHONY: load-modules
load-modules:
	@echo "Loading required modules: $(MODULES)..."
	$(foreach mod, $(MODULES), module load $(mod);)

.PHONY: clean
clean:
	@echo "Cleaning up the environment..."
	rm -rf $(VENV_DIR)

