# Pleiotropy project for Asthma, Adiposity and type 2 diabetes in jazf1 region (chr7:27868573-28273990)

## Aims

The aim of this project is to examine pleiotropic relationships between three phenotypes: asthma, type 2 diabetes (T2D), and waist circumference using the summary stats(regenie files from UKBB) based on the imputed data.

1. First we use GSMR (Generalised Summary-data-based Mendelian Randomisation) [Zhu et al. 2018 Nat. Commun] (https://www.nature.com/articles/s41467-017-02317-2) to test for putative causal association between asthma_t2d, waist_t2d and waist_asthma in jazf1 region. We also check the results with a more recent methods **MR-Corr2** and **CAUSE** as described by [Qiao et al. 2021 bioinformatics](https://pubmed.ncbi.nlm.nih.gov/34499127/) and [Morrison et al. 2020 Nat. Genet](https://pubmed.ncbi.nlm.nih.gov/32451458/)
2. Compare with bivariate fine mapping results from Jiayi Zhou

### Data files and locations
    data_description.ipynb
### Workflow to create the datafiles to be used for GSMR analyses
    20220424_Data_preparation.ipynb