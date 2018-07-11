# oesch-class

## Contents
1. Description
2. What this repository contains
3. Raw data
4. Instruction to generate the CSV file

## 1  Description
[Daniel Oesch](http://people.unil.ch/danieloesch/) (University of Lausanne) has developped a schema of social classes, which he discusses and applies in different publications (see Oesch 2006a, 2006b). On his personnal website, he offers [Stata, SPSS, and SAS scripts](http://people.unil.ch/danieloesch/scripts/) to generate the class schema using different surveys.

Scholars working with other programs (especially R) might be interested in using Oesch's class schema as well. This repository contains material to apply the class schema in Stata on data from the European Social Survey, rounds 1 to 8. The scripts produce a **CSV file** containing the class variables. This file can be **merged** again with ESS data using any program. The respondents number (`idno`), the country (`cntry`), and the ESS round (`essround`) serve as merging keys. 

Executing the do-files will produce the file `oesch_class_ess_1-8.csv`. If you don't want to redo the procedure yourself, you can **download this file immediately [here](https://raw.githubusercontent.com/jolyphil/oesch-class/master/data/oesch_class_ess_1-8.csv)**.

_References_

> Oesch, Daniel. 2006a. "Coming to Grips with a Changing Class Structure: An Analysis of Employment Stratification in Britain, Germany, Sweden and Switzerland." _International Sociology_ 21(2):263-88.

> Oesch, Daniel. 2006b. _Redrawing the Class Map: Stratification and Institutions in Britain, Germany, Sweden and Switzerland_. Houndmills, Basingstoke, Hampshire: Palgrave Macmillan.


## 2 What this repository contains

* Folders
  * `data/` will receive the final CSV file. It also contains a subfolder `raw/` where ESS raw data can be saved.
  * `do-files/` contains Stata do-files to produce the CSV file.
  * `logfiles/` is an empty folder where Stata logfiles will be stored.
  * `oesch_scripts/` contains the original scripts created by Daniel Oesch and Amal Tawfik, together with a revised version of the script prepared for the ESS 1 to 3. This revised script handles data for France (round 1) and Hungary (round 1 and 2) for which additional coding was necessary.
* Do-files
  * `0_set_directory.do` loads paths to the folders of the repository in global macros.
  * `1_code_classes.do` produces the CSV file.

## 3 Raw data
Data from the European Social Survey (rounds 1 to 8) was used to generate the class variables.

### 3.1 Conditions of use

Please consult the conditions of use of the [ESS]( http://www.europeansocialsurvey.org/data/conditions_of_use.html) before downloading the data. 

### 3.2 References

ESS. 2002. ESS Round 1: European Social Survey Round 1 Data. Data file edition 6.5. NSD - Norwegian Centre for Research Data, Norway - Data Archive and distributor of ESS data for ESS ERIC.

ESS. 2004. ESS Round 2: European Social Survey Round 2 Data. Data file edition 3.5. NSD - Norwegian Centre for Research Data, Norway - Data Archive and distributor of ESS data for ESS ERIC.

ESS. 2006. ESS Round 3: European Social Survey Round 3 Data. Data file edition 3.6. NSD - Norwegian Centre for Research Data, Norway - Data Archive and distributor of ESS data for ESS ERIC.

ESS. 2008. ESS Round 4: European Social Survey Round 4 Data. Data file edition 4.4. NSD - Norwegian Centre for Research Data, Norway - Data Archive and distributor of ESS data for ESS ERIC.

ESS. 2010. ESS Round 5: European Social Survey Round 5 Data. Data file edition 3.3. NSD - Norwegian Centre for Research Data, Norway - Data Archive and distributor of ESS data for ESS ERIC.

ESS. 2012. ESS Round 6: European Social Survey Round 6 Data. Data file edition 2.3. NSD - Norwegian Centre for Research Data, Norway - Data Archive and distributor of ESS data for ESS ERIC.

ESS. 2014. ESS Round 7: European Social Survey Round 7 Data. Data file edition 2.1. NSD - Norwegian Centre for Research Data, Norway - Data Archive and distributor of ESS data for ESS ERIC.

ESS. 2016. ESS Round 8: European Social Survey Round 8 Data. Data file edition 2.0. NSD - Norwegian Centre for Research Data, Norway - Data Archive and distributor of ESS data for ESS ERIC.


## 4 Instructions to generate the CSV file
A few steps are necessary.

### Step 1: Clone the repository

* Clone or download the repository on your own computer. 

### Step 2: Download the ESS data

* Go to the European Social Survey website and, from there, on [Data and Documentation by Year]( http://www.europeansocialsurvey.org/data/round-index.html).

#### a) Integrated files

* Download the "integrated files" in Stata format (DTA) for each of the eight ESS rounds. 
* Place the datafiles in their appropriate folder in `data/raw/`.
  * Example: `data/raw/ess1/ESS1e06_5.dta`

#### b) Country-specific data for France (rounds 1 and 2) and Hungary (round 2)

* Unfortunately, the ESS only provides country-specific data as SPSS portable files (POR).
* These files need to be converted in DTA format.
* The safest way to do this is to open the POR files in SPSS and, from there, to save them as DTA. 
* That's what I have done. The DTA files are already available in the repository.
  * Example: `data/raw/ess1/ESS1csFR.dta`

### Step 3: Set up your working directory

* The repository contains a do-file, `do-files/0_set_directory.do`, which details the hierarchical structure of the repository and allows to save the path to each folder in global macros. 
* If you cloned the repository, the only change you would need to do is to add the path to your local copy of the repository.
  * Update the line `global path "M:/user/joly/Analyses/oesch-class/"` with the path to your local copy of the repository. **Be sure that your path ends with `/`**
* Double-check that the paths to the source datafiles are correct.

### Step 4: Run the do-files

* Run `0_set_directory.do` to save the global macros. 
* Run `1_code_classes.do` to generate the CSV file. 
