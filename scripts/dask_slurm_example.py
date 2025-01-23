from dask_jobqueue import SLURMCluster
import socket
from dask.distributed import Client
from collections import Counter

cluster = SLURMCluster(
   cores=18,
   memory='24GB',
   account='<allocation_handle>',
   walltime='00:30:00',
   processes=17,
   queue='shared'
)

client = Client(cluster)

def test():
   return socket.gethostname()

result = []
cluster.scale(jobs=2)

for i in range(2000):
   result.append(client.submit(test).result())

print(Counter(result))
print(cluster.job_script())

