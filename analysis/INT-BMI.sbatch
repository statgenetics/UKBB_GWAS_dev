#!/bin/bash
#SBATCH --partition general
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 16
#SBATCH --mem-per-cpu 1G
#SBATCH --time 3-0:00:00
#SBATCH --job-name sos-submission
#SBATCH --output sos-submission-%J.out
#SBATCH --error sos-submission-%J.log

# Defining bash variables for the different paths,

cwd=~/scratch60/2020_04_bolt
output=output
bfile=/SAY/dbgapstg/scratch/UKBiobank/genotype_files/pleiotropy_geneticfiles/UKB_Caucasians_phenotypeindepqc120319_updated020720removedwithdrawnindiv
sampleFile=/SAY/dbgapstg/scratch/UKBiobank/genotype_files/ukb39554_imputeddataset
/ukb32285_imputedindiv.sample
bgenFile=/SAY/dbgapstg/scratch/UKBiobank/genotype_files/ukb39554_imputeddataset/*.bgen
phenoFile=/project/phenotypes_UKB/UKB_caucasians_BMIwaisthip_AsthmaAndT2D_INT-BMI_withagesex_041720
covarFile=/project/phenotypes_UKB/UKB_caucasians_BMIwaisthip_AsthmaAndT2D_INT-BMI_withagesex_041720
LDscoresFile=~/software/BOLT-LMM_v2.3.4/tables/LDSCORE.1000G_EUR.tab.gz
geneticMapFile=~/software/BOLT-LMM_v2.3.4/tables/genetic_map_hg19_withX.txt.gz
phenoCol= 'INT-BMI'
covarCol1 = 'SEX'
covarMaxLevels = 10
qCovarCol2 = 'AGE'
numThreads = 20
bgenMinMAF = 0.001
bgenMinINFO = 0.8

#Running the workflow for BMI trait

sos run ~/project/pleiotropy_UKB/worfkflow/BoltLMM.ipynb bolt -c ~/project/pleiotropy_UKB/farnam.yml -q farnam -J 40 \
    -s build &> sos-INT-BMI-060820.log
