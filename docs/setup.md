# Environment Setup

Dask and Ray are two powerful distributed computing frameworks that
enable scalable parallel processing, often used for data-intensive and
machine learning workflows. Unlike traditional MPI (Message Passing
Interface) frameworks, Dask and Ray operate at a higher level of
abstraction and do not directly require MPI for their operation.
Instead, they provide their own task scheduling and communication
mechanisms, which simplify setup and execution in distributed
environments. However, if Dask or Ray is deployed on a cluster that
relies on MPI for inter-node communication, they can integrate with
MPI-based systems through appropriate configuration or custom
implementations. In such cases, MPI libraries like OpenMPI or MPICH may
need to be installed on the cluster nodes. Still, for most general use
cases, Dask and Ray do not impose strict MPI requirements, making them
more accessible to a broader range of users and systems.

MPI can enhance performance and scalability in distributed computing by
optimizing communication between nodes, making it particularly useful for
tightly coupled tasks in high-performance computing (HPC). When using SLURM for
job scheduling, MPI can complement frameworks like Dask and Ray by enabling
efficient resource allocation and inter-node communication in HPC environments.
SLURM's integration with MPI allows users to launch distributed Dask or Ray jobs
that leverage SLURM's resource management and MPI's low-latency communication,
providing both flexibility and performance for large-scale workloads. This
combination is especially beneficial for tasks requiring fine-grained
parallelism or high communication efficiency.

## Initial Setup

`````{tab-set}
````{tab-item} Personal Environment
Use the following commands if you would like to setup your own environment. The
principle advantage is that the environment can be subsequently customized. Run
the following commands from a M3 terminal session, e.g. SSH or the SMU HPC
Portal M3 Shell Access.
```{code-block} sh
cd $HOME
git clone --recurse-submodules https://github.com/SouthernMethodistUniversity/distributed_python.git
cd distributed_python/env
make install
```
````
````{tab-item} Workshop Environment
Use the following commands if would like to use the already setup environment.
This option is only available to workshop participants.
```{code-block} sh
rsync -a --exclude 'dask_ray_workshop' /projects/rkalescky/dask_ray/shared_data/distributed_python $HOME/
```
````
`````

