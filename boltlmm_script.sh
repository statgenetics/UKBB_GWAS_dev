{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "#!/bin/bash\n",
    "#SBATCH --partition general\n",
    "#SBATCH --nodes 1\n",
    "#SBATCH --ntasks-per-node 1\n",
    "#SBATCH --mem-per-cpu 8G\n",
    "#SBATCH --time 1-0:00:00\n",
    "#SBATCH --job-name jupyter-notebook\n",
    "#SBATCH --output jupyter-notebook-%J.log\n",
    "\n",
    "# get tunneling info\n",
    "XDG_RUNTIME_DIR=\"\"\n",
    "port=$(shuf -i8000-9999 -n1)\n",
    "node=$(hostname -s)\n",
    "user=$(whoami)\n",
    "cluster=$(hostname -f | awk -F\".\" '{print $2}')\n",
    "\n",
    "# print tunneling instructions jupyter-log\n",
    "echo -e \"\n",
    "For more info and how to connect from windows,\n",
    "   see https://docs.ycrc.yale.edu/clusters-at-yale/guides/jupyter/\n",
    "\n",
    "MacOS or linux terminal command to create your ssh tunnel\n",
    "ssh -N -L ${port}:${node}:${port} ${user}@${cluster}.hpc.yale.edu\n",
    "\n",
    "Windows MobaXterm info\n",
    "Forwarded port:same as remote port\n",
    "Remote server: ${node}\n",
    "Remote port: ${port}\n",
    "SSH server: ${cluster}.hpc.yale.edu\n",
    "SSH login: $user\n",
    "SSH port: 22\n",
    "\n",
    "Use a Browser on your local machine to go to:\n",
    "localhost:${port}  (prefix w/ https:// if using password)\n",
    "\"\n",
    "\n",
    "# load modules or conda environments here\n",
    "# uncomment the following two lines to use your conda environment called notebook_env\n",
    "module load miniconda\n",
    "conda create -yn notebook_env anaconda python=3\n",
    "source activate notebook_env\n",
    "\n",
    "# DON'T USE ADDRESS BELOW.\n",
    "# DO USE TOKEN BELOW\n",
    "jupyter-notebook --no-browser --port=${port} --ip=${node}\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Bash",
   "language": "bash",
   "name": "bash"
  },
  "language_info": {
   "codemirror_mode": "shell",
   "file_extension": ".sh",
   "mimetype": "text/x-sh",
   "name": "bash"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
