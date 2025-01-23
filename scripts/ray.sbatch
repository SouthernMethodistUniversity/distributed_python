#!/bin/bash
#SBATCH -A rkalescky_dask_ray_0001
#SBATCH -J ray
#SBATCH -o ray.out
#SBATCH -N 2
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=1
#SBATCH --gpus-per-task=0
#SBATCH --mem=4G
#SBATCH -t 60
#SBATCH -p dev

module purge
module use ${HOME}/distributed_python/env
module load distributed_python
module load apptainer
#module use /users/rkalescky/ray_dask
#module -t load ray_dask
#export -f python
#export -f ray
#
#module list
#echo $MODULEPATH
#type -f ray

# Getting the node names
nodes=$(scontrol show hostnames "$SLURM_JOB_NODELIST")
nodes_array=($nodes)

head_node=${nodes_array[0]}
head_node_ip=$(srun --nodes=1 --ntasks=1 -w "$head_node" ip -f inet addr show ibp193s0 | awk '/inet / {print $2}' | cut -d/ -f1)

# if we detect a space character in the head node IP, we'll
# convert it to an ipv4 address. This step is optional.
if [[ "$head_node_ip" == *" "* ]]; then
IFS=' ' read -ra ADDR <<<"$head_node_ip"
if [[ ${#ADDR[0]} -gt 16 ]]; then
  head_node_ip=${ADDR[1]}
else
  head_node_ip=${ADDR[0]}
fi
echo "IPV6 address detected. We split the IPV4 address as $head_node_ip"
fi

port=6379
ip_head=$head_node_ip
export ip_head
echo "IP Head: $ip_head"

echo "Starting HEAD at $head_node"
srun --nodes=1 --ntasks=1 -w "$head_node" \
    ray start --temp-dir $SCRATCH/$SLURM_JOB_ID --head --node-ip-address="$head_node_ip" --port=0 \
    --num-cpus "${SLURM_CPUS_PER_TASK}" --block &

# optional, though may be useful in certain versions of Ray < 1.0.
sleep 10

# number of nodes other than the head node
worker_num=$((SLURM_JOB_NUM_NODES - 1))

for ((i = 1; i <= worker_num; i++)); do
    node_i=${nodes_array[$i]}
    echo "Starting WORKER $i at $node_i"
    srun --nodes=1 --ntasks=1 -w "$node_i" \
        ray start --temp-dir $SCRATCH/$SLURM_JOB_ID --address "$ip_head" \
        --num-cpus "${SLURM_CPUS_PER_TASK}" --block &
    sleep 5
done

wait

