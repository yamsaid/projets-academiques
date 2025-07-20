cd "Y:\LPAS_2\Cohorte3\STATA\stataWorkSpace"


********* EXERCICE 4 **********************************************************

**** 1. IMPORTATION **********************************************************
use "Y:\LPAS_2\Cohorte3\STATA\datasets for exercise\PMA data for exercise.dta", replace

**** 2. description 
describe

/* REPONSES
			 
	*** les variables au format chaine *******************************************

	FQmetainstanc~D, FRS_result, LAM; EC;current_method;first_birth;
	FQmarital_sta~s; FQSubmissionD~e; EA; EA_str; EA_num; county

	*** les variables au format entier ********************************************
	first_birth_m~h;FQ_age;EA_ID;ur;round;RE_ID;

	*** les variables au format reel ********************************************
	current_metho; femalester;malester;IUD;pill;injectables;implant;FQweight;over35

*/


**** 3. 
rename ur urban_rural

**** 4. 
drop if FQ_age <= 20

**** 5. FQ_age d'une décimale en une variable age catégorisée (<=25, 25-45, >=45), en utilisant générer ou recoder
gen age = ""
replace age = "<=25" if  FQ_age <=25 
replace age= "25-45" if FQ_age >25 & FQ_age <45
replace age= ">=45" if FQ_age >=45 

**** 6.
save "PMA data for exercise.dta"



*********** exo*******
split RE, parse(" ")