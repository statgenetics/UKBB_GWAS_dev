# Pleiotropy Project UKBB

## Overview

This project aims to elucidate variants which play a role in pleiotropy for complex diseases and traits with high public health significance.

We investigate phenotypes of strong public health significance, for which there is support for potential pleiotropy. 
For example, there may exist pleiotropic relationships between asthma-adiposity, asthma-T2D, adiposity-T2D,
 blood lipids-adiposity, CVD-Alzhemier's disease, and age related hearing impairment (ARHI)-tinnitus. A formal evaluation of pleiotropy for these phenotypes may 
reveal novel loci and shed light on the mechanistic relationship between these variants and phenotypes.

We use UK Biobank data for these phenotypes, and perform genome-wide association scan for both genotyped and imputed variants, 
analyzing association for both common and rare variants using linear mixed model (LMM).
We then look for evidence of pleiotropy in regions where more than one phenotype have detectable association signals, focusing on
the following pairs of traits: asthma-adiposity, T2D-adiposity, asthma-T2D, LDL-HDL, LDL-TG, HDL-TG, adiposity-LDL, adiposity-HDL,
adiposity-TG, T2G-LDL, T2D-HDL, T2D-TG and ARHI-tinnitus. Methods for fine-mapping, pleiotropy
and mediation analysis will be applied to these regions. We use TOPMed as a secondary replication dataset. 

## Goals

1. **Extension of methods for rare and imputed variants and implementation in SEQSpark**
2. **Detect pleiotropic effects for a variety of diseases and complex traits using rare variant and imputed data**
3. **Determine tissue types most relevant to complex trait/disease etiology**
4. **Analysis of tissue-specific expression levels with phenotype data to biologically validate pleiotropic effects**

The main goal here is to analyze imputed and rare variants for association with different traits (asthma, BMI, waist-to-hip ratio, diabetes, waist circumference). First through a single variant analysis using Linear Mixed Models.

## Association scans using LMM

FIXME: add links and status

## Candidate region analysis

For given regions of interest across multiple phenotypes, a number of statistical workflows will be developed for fine-mapping, pleiotropy, and mediation analysis. Candidate regions will be examined with a number of published & in-house methods looking to reveal
the possible causal relationship between genetic variants and multiple phenotypes. The approach developed can also be applied to looking at a number of molecular phenotypes
such as gene expression, splicing, methylation, etc.

Additionally, some of these methods can be generated to analyzing rare variants in the context of multiple phenotypes.

FIXME: add links to relevant issues on this page: 

https://github.com/statgenetics/UKBB_GWAS_dev/issues

# Hearing impairment Project UKBB

## **Documents**

1. Analisis plan for each phenotype can be found [here](https://docs.google.com/document/d/1cpxTzElpsEkwmBDjnMBHg2wW7CL1AcG_b0_0wE_k5rQ/edit)

2. Exclusion criteria applied to the data set is [here](https://docs.google.com/spreadsheets/d/12L7Cx4Ov8FppGVmG0DxL9uG-lVRHM5QJSea0nORyirQ/edit#gid=0)


**Location of the files on Yale's cluster:**

**Hard-called genotype files:** /SAY/dbgapstg/scratch/UKBiobank/genotype_files/pleiotropy_geneticfiles/UKB_Caucasians_phenotypeindepqc120319_updated082020removedwithdrawnindiv.bed

**Imputed genotypes:** /SAY/dbgapstg/scratch/UKBiobank/genotype_files/ukb39554_imputeddataset/

**Unrelated samples:** /SAY/dbgapstg/scratch/UKBiobank/genotype_files/pleiotropy_geneticfiles/unrelated_n307259/UKB_unrelatedcauc_phenotypes_asthmat2dbmiwaisthip_agesex_waisthipratio_040620

**Results:** /SAY/dbgapstg/scratch/UKBiobank/results/

**Phenotype files:** /SAY/dbgapstg/scratch/UKBiobank/phenotype_files/

**Location of the files on Columbias's cluster:**

**Results:** /mnt/mfs/statgen/UKBiobank/results

# Release website

To generate the website,

```
source jnbinder-docker.sh
jnbinder
```
