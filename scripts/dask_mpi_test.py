#!/usr/bin/env python3

#import dask.array as da
from dask.distributed import Client, performance_report
#client = Client(scheduler_file='~/dask-scheduler.json')

# batch_workload.py
from dask_jobqueue.slurm import SLURMRunner
cluster = SLURMRunner()  # Boostraps all the processes into a client + scheduler + 10 workers

# Only the client process will continue past this point

#from dask.distributed import Client
client = Client(cluster)  # Connect this client process to remote workers

import dask.array as da

def example_function():
    x = da.random.random((100_000, 100_000, 10), chunks=(10_000, 10_000, 5))
    y = da.random.random((100_000, 100_000, 10), chunks=(10_000, 10_000, 5))
    z = (da.arcsin(x) + da.arccos(y)).sum(axis=(1, 2))

    with performance_report(filename="dask-report_mpi.html"):
        result = z.compute()

example_function()

