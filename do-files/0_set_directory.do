********************************************************************************
* Project:	Recode ESS data to produce Oesch's class schema
* Task:		Set up working directory
* Author:	Philippe Joly, Humboldt-Universität zu Berlin
********************************************************************************

* Important:
	* Run this do-file before running any other di-file in the repository.
	* This file loads paths to the folders of the repository in global macros.

* ______________________________________________________________________________
* Main path

global path "M:/user/joly/Analyses/oesch-class/" // **Put your own path here**

* ______________________________________________________________________________
* Folders

global data "${path}data/"
	global data_raw "${data}raw/"
global dofiles "${path}do-files/"
global logfiles "${path}logfiles/"
global oesch_scripts "${path}oesch_scripts/"

* ______________________________________________________________________________
* Source datafiles

global ess1 "${data_raw}ess1/ESS1e06_5.dta" // ESS 1
global ess2 "${data_raw}ess2/ESS2e03_5.dta" // ESS 2
global ess3 "${data_raw}ess3/ESS3e03_6.dta" // ESS 3
global ess4 "${data_raw}ess4/ESS4e04_4.dta" // ESS 4
global ess5 "${data_raw}ess5/ESS5e03_3.dta" // ESS 5
global ess6 "${data_raw}ess6/ESS6e02_3.dta" // ESS 6
global ess7 "${data_raw}ess7/ESS7e02_1.dta" // ESS 7
global ess8 "${data_raw}ess8/ESS8e02.dta" // ESS 8

global ess1csfr "${data_raw}ess1/ESS1csFR.dta" // ESS 1
global ess2csfr "${data_raw}ess2/ESS2csFR.dta" // ESS 1
global ess2cshu "${data_raw}ess2/ESS2csHU.dta" // ESS 1

* ______________________________________________________________________________
* Source ESS miss do-file

global ess_miss "${data_raw}ESS_miss/ESS_miss.do" // Handles ESS missing data

* ______________________________________________________________________________
* Source Oesch scripts for social class

global oesch_1 "${oesch_scripts}REVISED_Oesch_class_schema_ESS2002_2006_Stata.do" // Recode ESS 1 to 3
global oesch_2 "${oesch_scripts}Oesch_class_schema_ESS2008_2010_ESS_Cumulative_Data_Wizard_Stata.do" // Recode ESS 4 to 5
global oesch_3 "${oesch_scripts}Oesch_class_schema_ESS2012_Stata.do" // Recode ESS 6 to 8
