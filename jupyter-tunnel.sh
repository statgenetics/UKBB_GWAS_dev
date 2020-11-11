#!/bin/bash
#SBATCH --partition general
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --mem-per-cpu 30G
#SBATCH --time 24:00:00
#SBATCH --job-name jupyter-notebook
#SBATCH --output jupyter-notebook-%J.log

# get tunneling info
XDG_RUNTIME_DIR=""
port=$(shuf -i8000-9999 -n1)
node=$(hostname -s)
user=$(whoami)
cluster=$(hostname -f | awk -F"." '{print $2}')

# print tunneling instructions jupyter-log
echo -e "
For more info and how to connect from windows,
   see https://docs.ycrc.yale.edu/clusters-at-yale/guides/jupyter/

MacOS or linux terminal command to create your ssh tunnel
ssh -N -L ${port}:${node}:${port} ${user}@${cluster}.hpc.yale.edu

Windows MobaXterm info
Forwarded port:same as remote port
Remote server: ${node}
Remote port: ${port}
SSH server: ${cluster}.hpc.yale.edu
SSH login: $user
SSH port: 22

Use a Browser on your local machine to go to:
localhost:${port}  (prefix w/ https:// if using password)
"

# load modules or conda environments here
# uncomment the following two lines to use your conda environment called notebook_env
#module load miniconda
#conda create -yn notebook_env anaconda python=3
#source activate notebook_env


# DON'T USE ADDRESS BELOW.
# DO USE TOKEN BELOW
# Start jupyter
cd
jupyter-lab --no-browser --port=${port} --ip=${node}
