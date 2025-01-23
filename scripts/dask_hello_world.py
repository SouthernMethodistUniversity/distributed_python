from dask_mpi import initialize
from distributed import Client
import socket

# Initialize the Dask cluster using MPI
initialize()

# Connect to the Dask scheduler
client = Client()

# Define a simple task function
def hello_world(arg=None):
    return f"Hello from {socket.gethostname()}!"

if __name__ == "__main__":
    # Submit tasks to the Dask cluster
    futures = client.map(hello_world, range(4))  # Four tasks to be distributed
    results = client.gather(futures)  # Collect results from workers

    # Print results
    for result in results:
        print(result)

    client.close()


