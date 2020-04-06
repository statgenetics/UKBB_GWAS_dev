#!/bin/bash

#Script for running BOLT-LMM for quantitative traits
#UKB british population

bfile="/SAY/dbgapstg/scratch/UKBiobank/genotype_files/pleiotropy_geneticfiles/UKB_Caucasians_phenotypeindepqc120319_updated020720removedwithdrawnindiv" # path to .fam, .bim and .bed files
phenoFile="/SAY/dbgapstg/scratch/UKBiobank/phenotype_files/pleiotropy_R01/phenotypesforanalysis/UKB_caucasians_BMI_nopreg_adjagesex_residuals_andstandardized_022720" # path to phenotype file 
covarFile="/SAY/dbgapstg/scratch/UKBiobank/phenotype_files/pleiotropy_R01/phenotypesforanalysis/UKB_caucasians_BMIwaisthip_AsthmaAndT2D_withagesex_033120" # path to covariates file
covarCol1="sex" # qualitative covariates
covarMaxLevels="10" # number of maximum categories for qualitate variables 
qCovarCol2="age" # quantitative covariates
qCovarCol3="PC{1:20}" # shorhand array to specify columns PC1 to PC20
LDscoresFile="tables/LDSCORE.1000G_EUR.tab.gz" # LD scores for european population
geneticMapFile="tables/genetic_map_hg19.txt.gz" #  interpolate genetic map coordinates from SNP physical (base pair) positions
numThreads="8" # number of threads to be used
statsFile="bolt_500UKB_selfRepWhite.BMI.stats.gz" # name of output file with bolt-lmm stats
bgenFile="/SAY/dbgapstg/scratch/UKBiobank/genotype_files/ukb_imp_chr{1:22}_v3.bgen" # path to imputed data in .ben format
bgenMinMAF="0.001"
bgenMinINFO="0.8"
sampleFile="/SAY/dbgapstg/scratch/UKBiobank/genotype_files/ukb39554_imputeddataset/ukb32285_imputedindiv.sample"
statsFileBgenSnps="bolt_500K_selfRepWhite.BMI.bgen.stats.gz"

./bolt \
    --bfile=${bfile} \
    --phenoFile=${phenoFile} \
    --phenoCol=residuals \
    --covarFile=${covarFile} \
    --covarCol=${covarCol1} \
    --covarMaxLevels=${covarMaxLevels} \
    --qCovarCol=${qCovarCol2} \
    --qCovarCol=${qCovarCol3}\
    --LDscoresFile=${LDscoresFile} \
    --geneticMapFile=${geneticMapFile} \
    --lmmForceNonInf \
    --numThreads=${numThreads} \
    --statsFile=${statsFile} \
    --bgenFile=${bgenFile} \
    --bgenMinMAF=${bgenMinMAF} \
    --bgenMinINFO=${bgenMinINFO} \
    --sampleFile=${sampleFile} \
    --statsFileBgenSnps=${statsFileBgenSnps} \
    --verboseStats
