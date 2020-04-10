#!/bin/bash
#SBATCH --partition general
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --mem-per-cpu 8G
#SBATCH --time 3-0:00:00
#SBATCH --job-name sos-submission
#SBATCH --output sos-submission-%J.out
#SBATCH --error sos-submission-%J.log
sos run ...
