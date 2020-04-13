# Pleiotropy Project UKB

## **Goals**

1. **Extension of methods for rare and imputed variants and implementation in SEQSpark**
2. **Detect pleiotropic effects for a variety of diseases and complex traits using rare variant and imputed data**
3. **Determine tissue types most relevant to complex trait/disease etiology**
4. **Analysis of tissue-specific expression levels with phenotype data to biologically validate pleiotropic effects**

The main goal here is to analyze imputed and rare variants for association with different traits (asthma, BMI, waist-to-hip ratio, diabetes, waist circumference). First single variant analysis. 

## Location of phenotypic, genotypic and imputed data files used in the project

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

### Genotypic files in PLINK binary format: used to compute the genetic relationship matrix

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

### Summary statistics

`/SAY/dbgapstg/scratch/UKBiobank/results/BOLTLMM_results`

## BOLT-LMM options 

BOLT-LMM software computes statistics for testing association between phenotypes and genotypes using a linear mixed model

`--bfile` accepts genotype files in PLINK binary format (.fam, .bed, .bim)
`--geneticMapFile` Oxford-format file for interpolating genetic distances: tables/genetic_map_hg##.txt.gz
`--phenoFile` phenotype file (header required; FII and IID must be first two columns)
`--phenoCol` phenotype columns header
`--covarFile` covariate file (header required; FII and IID must be first two columns)
`--covarCol` categorical covariate column(s); for >1, use multiple `--covarCol` and/or {i:j} expansion
`--qcovarCol` quantitative covariate column(s); for  >1, use multiple `--qCovarCol` and/or {i:j} expansion
`--lmm` compute assoc stats under the inf model and with Bayesian non-inf prior (VB approx), if power gain expected
`--modelSnps` file(s) listing SNPs to use in model (i.e., GRM) (default: use all non-excluded SNPs)
`--LDscoresFile` LD Scores for calibration of Bayesian assoc stats: tables/LDSCORE.1000G_EUR.tab.g
`--numThreads` number of computational threads
`--statsFile` output file for assoc stats at **PLINK genotypes**
`--bgenFile` file(s) containing Oxford BGEN-format genotypes to test for association
`--sampleFile` file containing Oxford sample file corresponding to BGEN file(s)
`--bgenMinMAF` MAF threshold on Oxford BGEN-format genotypes; lower-MAF SNPs will be ignored
`--bgenMinINFO` INFO threshold on Oxford BGEN-format genotypes; lower-INFO SNPs will be ignored
`--statsFileBgenSNPs` output file for assoc stats at **BGEN-format genotypes**
