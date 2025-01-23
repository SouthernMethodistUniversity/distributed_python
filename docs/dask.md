# Dask

## Overview

Dask is an open-source Python library designed for parallel computing, enabling
efficient scaling of data analysis workflows from single machines to large
distributed clusters. It extends familiar interfaces like NumPy, Pandas, and
scikit-learn, allowing users to handle larger-than-memory datasets and perform
complex computations with minimal code changes. Dask's high-level
collections, such as DataFrames, Arrays, and Bags, facilitate parallel operations
on structured and unstructured data, while its dynamic task scheduler optimizes
execution across multiple cores or nodes. This versatility makes Dask suitable
for a wide range of applications, including retail demand forecasting,
large-scale image processing in life sciences, financial system modeling, and
geophysical data analysis.

```{include} ood_jupyter.md
```
2. Work through `./src/dask/intro.ipynb`

## Scaling Out

Setting up a multi-node Dask cluster using MPI and TCP involves configuring Dask
to operate across multiple nodes, leveraging MPI for process management and TCP
for inter-process communication. The `dask-mpi` package facilitates this by
enabling the deployment of Dask components within an existing MPI environment.
When integrating with SLURM, the approach varies depending on the specific Dask
functionality required. For instance, using `dask-mpi`, you can initialize the
Dask scheduler and workers by executing a Python script with `mpirun` or
`mpiexec`, which launches the scheduler on MPI rank 0 and workers on subsequent
ranks. Alternatively, the `dask-jobqueue` library provides the `SLURMCluster`
class, allowing for dynamic allocation of Dask workers as separate SLURM jobs,
which is particularly useful for interactive workloads. The choice between these
methods depends on the application's nature and the desired level of control
over the cluster's resources. Template scripts for launching Dask via MPI are
available in the `./scripts` directory.

