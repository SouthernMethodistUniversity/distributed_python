# Ray

## Overview

Ray is a powerful distributed computing framework designed to simplify the
development of scalable and high-performance applications by abstracting the
complexities of parallelism and distributed execution. It enables users to
effortlessly parallelize and scale Python code across multiple CPUs or GPUs,
making it ideal for building machine learning models, data processing pipelines,
reinforcement learning algorithms, and real-time decision-making systems. One
notable feature of Ray is its versatility, supporting libraries like Dask to run
on top of it, thus enabling users to leverage Dask’s familiar API for advanced
task scheduling and parallel computing while benefiting from Ray’s robust
resource management. This combination makes Ray a valuable tool for tackling
complex computational workloads in areas such as deep learning, data analytics,
simulation, and model serving.

## Tutorial

1. Launch JupyterLab session with the following configuration:
    - **Slurm Account**: `rkalescky_dask_ray_0001`
    - **Partition**: `standard-s`
    - **Select Python Environment**: `Custom Environment - only use what is specified below`
    - **Custom Environment Settings**:
        ```sh
        module purge
        module use ${HOME}/distributed_python/env
        module load distributed_python
        ```
    - **Time (Hours)**: 2
    - **Cores per node**: 8
    - **Memory**: 32
2. Work through `./src/ray/ex_01_remote_funcs.ipynb`

