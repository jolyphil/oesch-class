********************************************************************************
* Project:	Recode ESS data to produce Oesch's class schema
* Task:		Append ESS data, merge coutry-specific data, apply Oesch's schema
* Author:	Philippe Joly, Humboldt-Universität zu Berlin
********************************************************************************

version 15
capture log close
capture log using "${logfiles}1_code_classes.smcl", replace
set more off

* ______________________________________________________________________________
* Append ESS data and merge coutry-specific data

forvalues i = 1(1)8 {
	use "${ess`i'}", clear

	if `i'==1 {
		merge 1:1 idno cntry using "${ess1csfr}", nogen
		gen emprelhu = .
		gen emprlphu = .
	} 
	else if `i'==2 {
		merge 1:1 idno cntry using "${ess2csfr}", nogen
		merge 1:1 idno cntry using "${ess2cshu}", nogen
	}
	else {
		gen emprlfr = .
		gen emprlpfr = .
		gen emprelhu = .
		gen emprlphu = .
	}

	if `i'<6 {
		gen isco08 = .
		gen isco08p = .
	}
	else if `i'>=6 {
		gen iscoco = .
		gen iscocop = .
		gen emplnop = .
	}
	
	keep iscoco emplrel emplno iscocop emprelp emplnop isco08 isco08p ///
		emprlfr emprlpfr emprelhu emprlphu ///
		cntry essround idno
	
	if `i'>1 {
		append using "${data}ess.dta", force
	}
	save "${data}ess.dta", replace
}

* ______________________________________________________________________________
* Apply Oesch's schema separately on ESS 1-3, 4-5, and 6-8

* Preserve dataset before splitting sample 
tempfile master  // temporary dataset
save "`master'"

* ESS 1, 2, and 3
keep if essround == 1 | essround == 2 | essround == 3
do "${oesch_1}" // Script 1: recode ESS 1 to 3
tempfile ess_1_3  // temporary dataset: ESS 1 to 3
save "`ess_1_3'"

* ESS 4 and 5
use "`master'", clear
keep if essround == 4 | essround == 5
do "${oesch_2}" // Script 2: recode ESS 4 and 5
tempfile ess_4_5  // temporary dataset: ESS 4 and 5
save "`ess_4_5'"

* ESS 6, 7, and 8
use "`master'", clear
keep if essround == 6 | essround == 7 | essround == 8
do "${oesch_3}" // Script 3: recode ESS 6 to 8
tempfile ess_6_8  // temporary dataset: ESS 6 to 8
save "`ess_6_8'"

* Reassemble dataset
append using "`ess_1_3'"
append using "`ess_4_5'"

* Keep key identifiers and class variables
keep essround idno cntry ///
	class16_r class8_r class5_r ///
	class16_p class8_p class5_p ///
	class16 class8 class5	
	
* ______________________________________________________________________________
* Save as CSV
	
export delimited using "${data}oesch_class_ess_1-8.csv", nolabel replace
	
* ______________________________________________________________________________
* Close

log close
exit
