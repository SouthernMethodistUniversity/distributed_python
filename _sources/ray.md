# Ray

## Overview

Ray is a powerful distributed computing framework designed to simplify the
development of scalable and high-performance applications by abstracting the
complexities of parallelism and distributed execution. It enables users to
effortlessly parallelize and scale Python code across multiple CPUs or GPUs,
making it ideal for building machine learning models, data processing pipelines,
reinforcement learning algorithms, and real-time decision-making systems. One
notable feature of Ray is its versatility, supporting libraries like Dask to run
on top of it, thus enabling users to leverage Dask's familiar API for advanced
task scheduling and parallel computing while benefiting from Ray's robust
resource management. This combination makes Ray a valuable tool for tackling
complex computational workloads in areas such as deep learning, data analytics,
simulation, and model serving.

```{include} ood_jupyter.md
```
2. Work through `./src/ray/ex_01_remote_funcs.ipynb`

## Scaling Out

Setting up multi-node Ray involves configuring a Ray cluster where one node acts
as the head node, and others join as worker nodes. The process typically starts
by initializing the head node with `ray start --head` and specifying cluster
options such as the port. Worker nodes are then started using `ray start
--address='head-node-address:port'`. When using SLURM for job scheduling, the
setup can vary depending on the specific Ray functionality required by the
application. For example, applications that rely on Ray's distributed data
processing features, like Ray Datasets or libraries like Dask-on-Ray, may
require careful resource allocation to ensure sufficient memory and compute
resources are available on each node. In contrast, reinforcement learning
workloads using Ray's RLlib library might prioritize GPU resources and
inter-node communication bandwidth. Tailoring the SLURM job scripts with
specific options, e.g. `srun` and `sbatch`, and resource flags ensures that Ray's
functionality aligns with the application's needs, providing both flexibility
and scalability.

