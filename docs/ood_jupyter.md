## Tutorial

1. Launch JupyterLab session with the following configuration:
    - **Slurm Account**: `rkalescky_dask_ray_0001`
    - **Partition**: `standard-s`
    - **Select Python Environment**: `Custom Environment - only use what is specified below`
    - **Custom Environment Settings**:
        `````{tab-set}
        ````{tab-item} Personal Environment
        ```sh
        module purge
        module use ${HOME}/distributed_python/env
        module load distributed_python
        ```
        ````
        ````{tab-item} Workshop Environment
        ```sh
        module purge
        module use /projects/rkalescky/dask_ray/shared_data/distributed_python/env
        module load distributed_python
        ```
        ````
        `````
    - **Time (Hours)**: 2
    - **Cores per node**: 8
    - **Memory**: 32
