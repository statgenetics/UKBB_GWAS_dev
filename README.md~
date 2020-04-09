# Pleiotropy UKB

## **Goals**

1. **Extension of methods for rare and imputed variants and implementation in SEQSpark**
2. **Detect pleiotropic effects for a variety of diseases and complex traits using rare variant and imputed data**
3. **Determine tissue types most relevant to complex trait/disease etiology**
4. **Analysis of tissue-specific expression levels with phenotype data to biologically validate pleiotropic effects**

The main goal here is to analyze imputed and rare variants for association with different traits (asthma, BMI, waist-to-hip ratio, diabetes, waist circumference). First single variant analysis. 

## Access to Yale HPC cluster

* VNP: access.yale.edu
* username: dc2325
* password: D28CA11E
* MFA: push #after this accept the access in the duo mobile app

*In the terminal*
```
$ ssh dc2325@farnam.hpc.yale.edu
$ Dmcs1988!@
```

### Important HPC commands

```
$ module avail # For a list of modules available to use
$ module list # Displays all of the module files that are currently loaded in your environment
$ module avail python # To look for specific modules
$ module spider # Displays a description of all available modules

```

## Location of important files

### Phenotypic files
```
$ cd /SAY/dbgapstg/scratch/UKBiobank/phenotype_files/pleiotropy_R01/phenotypesforanalysis
$ ls -F
```
Output: 
*  Asthma_casesbyICD10codesANDselfreport_controlsbyselfreportandicd10_forbolt030720
*  Asthma_casesbyICD10codesANDselfreport_controlsbyselfreportandicd10_noautoimmuneincontrols_forbolt030720
*  diabetes_casesbyICD10andselfreport_controls_030620
*  diabetes_casesbyICD10andselfreport_controlswithoutautoiummune_030720
*  UKB_caucasians_BMI_nopreg_adjagesex_residuals_andstandardized_022720
*  UKB_caucasians_BMIwaisthip_AsthmaAndT2D_withagesex_033120
*  UKB_caucasians_waistcircumference_adjbmiagesex_nopreg_residuals_022720
*  UKB_caucasians_waisthipratio_adjbmiagesex_nopreg_residuals_022720

### Fam files in PLINK format

```
/SAY/dbgapstg/scratch/UKBiobank/genotype_files/pleiotropy_geneticfiles
```
* UKB_Caucasians_phenotypeindepqc120319_updated020720removedwithdrawnindiv.fam
* UKB_Caucasians_phenotypeindepqc120319_updated020720removedwithdrawnindiv.bim
* UKB_Caucasians_phenotypeindepqc120319_updated020720removedwithdrawnindiv.bed

### Imputed genotypes, phased haplotypes and mfi-infoscore

```
/SAY/dbgapstg/scratch/UKBiobank/genotype_files/ukb39554_imputeddataset
```

**Sample file:** ukb32285_imputedindiv.sample

**Phased haplotypes:** ukb_hap_chrN_v2.bgen, ukb_hap_chrN_v2.bgen.bgi

**Imputed genotype calls:** ukb_imp_chrN_v3.bgen, ukb_imp_chrN_v3.bgen.bgi

**Imputation minor allele frequency and information scores:** ukb_mfi_chrN_v3.txt

