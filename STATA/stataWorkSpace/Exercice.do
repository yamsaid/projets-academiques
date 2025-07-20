/*******************************************************************************
 *************** L'EXPERT YAMEOGO **********************************************
 *************** 20-02-2025 ****************************************************
 ************** Ancien devoir 2024 *********************************************
 ******************************************************************************/

cd Y:\LPAS_2\Cohorte3\STATA\stataWorkSpace

import spss using "Projet.sav", clear

import spss using "Y:\LPAS_2\Cohorte3\SPSS\data\data1.sav" , clear

recode Age_revolu (0/24=1) (25/34=2) (35/45=3) (46/71=4), gen(AGEGR)


label define age_var_liste 1 "Enfant" 2 "Jeune" 3 "Adulte" 4 "3em age"

label values AGEGR age_var_liste