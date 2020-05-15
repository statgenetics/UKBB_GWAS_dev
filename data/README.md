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