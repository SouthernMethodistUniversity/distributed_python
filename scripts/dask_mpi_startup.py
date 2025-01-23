from dask_mpi import initialize
from dask.distributed import Client

# Initialize the Dask cluster using MPI
initialize(interface="ibp193s0")

# Optional: Create a Dask client (useful for testing or submitting tasks in this script)
#client = Client()
#print(client)  # Displays cluster information

# Keep the cluster running (if required)
import time

while True:
  time.sleep(60)

