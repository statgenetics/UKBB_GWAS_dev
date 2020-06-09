#!/bin/bash

#Defining bash variables for the different paths

output=output
bfile=~/scratch60/plink-clumping/MWE/UKB_Caucasians_phenotypeindepqc120319_updated020720removedwithdrawnindiv.MWE_data
sampleFile=~/scratch60/plink-clumping/MWE/ukb_imp_chr1_v3.filtered.sample
bgenFile=~/scratch60/plink-clumping/MWE/*.filtered.bgen
phenoFile=~/scratch60/plink-clumping/MWE/phenotypes.txt
covarFile=~/scratch60/plink-clumping/MWE/phenotypes.txt
LDscoresFile=~/software/BOLT-LMM_v2.3.4/tables/LDSCORE.1000G_EUR.tab.gz
geneticMapFile=~/software/BOLT-LMM_v2.3.4/tables/genetic_map_hg19_withX.txt.gz
phenoCol='BMI'
covarCol1='SEX'
covarMaxLevels=10
qCovarCol2='AGE'
numThreads=5
bgenMinMAF=0.001
bgenMinINFO=0.1

#Running the workflow for the MWE

sos run ~/project/pleiotropy_UKB/worfkflow/BoltLMM.ipynb bolt -q localhost -j 8 \
    --cwd $output \
    --bfile $bfile \
    --sampleFile $sampleFile 
    --bgenFile $bgenFile \
    --phenoFile $phenoFile \
    --covarFile $covarFile \
    --LDscoresFile $LDscoresFile \
    --geneticMapFile $geneticMapFile \
    --phenoCol $phenoCol \
    --covarCol1 $covarCol1 \
    --covarMaxLevels $covarMaxLevels \
    --qCovarCol2 $qCovarCol2 \
    --numThreads $numThreads \
    --bgenMinMAF $bgenMinMAF \
    --bgenMinINFO $bgenMinINFO \
    &> sos-MWE-060820.log
