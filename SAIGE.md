### SAIGE

## Installation

To install SAIGE in the HRC cluster first load necessary modules to create aspecific environment

# Search and load modules

* `module avail` for a list of all available modules
 
* `module avail R` to see a list of all available R modules in Yale's HRC

	Select R-3.6.1 version if available by typing `module load R-3.6.1`

* `module avail gcc`

	Select gcc >= 5.4.0: `module load gcc-5.4.1`

* `module avail cmake`

	Select cmake 3.14.1: `module load cmake-3.14.1`

* `module avail cget`

	Select the latest version of cget: `module load cget`

* Install R packages using the `install_packages.R` script

* Install SAIGE R package
	
```
R 
devtools::install_github("weizhouUMICH/SAIGE")`
```


Fixing problem with conda template: can't execute `conda activate` from bash script 
https://github.com/conda/conda/issues/7980

Added these variables to `.bash_profile` apparently fixed the issue

```
export -f conda
export -f __conda_activate
export -f __conda_reactivate
export -f __conda_hashr
        
```
Then `source .bash_profile`


my-script.sh: line 8: __add_sys_prefix_to_path: command not found