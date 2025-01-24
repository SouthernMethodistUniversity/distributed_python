MODULES = gcc/11.2.0 openmpi/4.1.6-vfi4iwj python/3.12.5-b22gg7o
VENV_DIR = ./dask_ray_workshop
REQ_FILE = requirements.txt
PC = /hpc/m3/spack/opt/spack/linux-ubuntu22.04-zen3/gcc-11.2.0/openmpi-4.1.6-vfi4iwjdhfs6jbi7qj2ma7bba57bgm6v/lib/pkgconfig
export PKG_CONFIG_PATH := $(PKG_CONFIG_PATH):$(PC)

SHELL := /bin/bash

.PHONY: setup
setup: load-modules $(VENV_DIR)

$(VENV_DIR):
	@echo "Creating Python virtual environment in $(VENV_DIR)..."
	python3.12 -m venv $(VENV_DIR)

.PHONY: install
install: load-modules $(VENV_DIR) $(REQ_FILE)
	@echo "Activating virtual environment and installing dependencies..."
	source $(VENV_DIR)/bin/activate && \
	pip install --no-cache-dir -U --force-reinstall pip wheel setuptools && \
	pip install --no-cache-dir --no-binary :all: --compile mpi4py && \
	pip install --no-cache-dir -r $(REQ_FILE) && \
	pip install --no-cache-dir torch torchvision torchaudio \
	--index-url https://download.pytorch.org/whl/cpu

.PHONY: load-modules
load-modules:
	@echo "Loading required modules: $(MODULES)..."
	$(foreach mod, $(MODULES), module load $(mod);)

.PHONY: clean
clean:
	@echo "Cleaning up the environment..."
	rm -rf $(VENV_DIR)

