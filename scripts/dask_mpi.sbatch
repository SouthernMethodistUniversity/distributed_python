#!/bin/bash
#SBATCH -A rkalescky_dask_ray_0001
#SBATCH -J dask_mpi
#SBATCH -o dask_mpi_%j.out
#SBATCH -N 2
#SBATCH --ntasks-per-node=2
#SBATCH --mem=4G
#SBATCH -t 5
#SBATCH -p dev

module purge
module use ${HOME}/distributed_python/env
module load distributed_python

scheduler_file=${SLURM_JOB_NAME}_${SLURM_JOB_ID}.json

srun dask-mpi\
 --scheduler-file ${scheduler_file}\
 --interface ibp193s0\
 python dask_hello_world.py

