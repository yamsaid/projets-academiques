***********************************************************************
****** 04/02/2025 16:43*******
******* Yameogo saidou ***************************

*** EXERCICE D'APPLICATION 1***************


*** Creation de log file **********
log using notes.log


*********** OUVERTURE UN FICHIER STATA *************************
*ouverture d'une base de format stata (.dta) en general

use "Y:\LPAS_2\Cohorte3\STATA\datasets for exercise\PMA data for exercise.dta"

*ouverture d'une base de format stata (.dta) enregistrer dans mon workSpace

 use "PMA data for exercise.dta",replace
 
 ************************* SAUVEGARDER EN FORMAT STATA ***************
 * sauvegarder une base en format dta en general 
 
 save "path\out.dta"
 
 * sauvegarder une base en format dta dans mon workSpace
 
 save "out.dta"
 
* 
save "LPAS data for exercice_excel.dta"
 
 ************** IMPORTATION DE FICHIER AUTRE QUE STATA
 * Fichier excel
 
 import excel "Y:\LPAS_2\Cohorte3\STATA\datasets for exercise\PMA data for exercise.xlsx", sheet("Sheet1") firstrow clear
 
 * Fichier csv
 
 import delimited "Y:\LPAS_2\Cohorte3\STATA\datasets for exercise\PMA data for exercise.csv", clear
 
 insheet using "Y:\LPAS_2\Cohorte3\STATA\datasets for exercise\PMA data for exercise.csv", clear
 
 
 
 ********** EXPORTATION SOUS FORMAT AUTRE QUE .dta *****************************
 
 * Format .xlsx
 
 export excel data_ange.xls
 
 ************************************************************************Fin 18h ************************************************************
 
**************** 06-02-2025 ** 14h ***********************************

****** MANIPULATION DES DONNEES *************************************

* sourcer l'environnement de travail 
cd "Y:\LPAS_2\Cohorte3\STATA\stataWorkSpace"

* utilisons le fichier 

use "out1.dta",replace

* descriptions de la base 
describe

* les variables de la base
describe, simple

* une bref analyse de chaque variable (moyenne, missing, )
codebook

* statistique descriptives.Ajouter detail pour plus de details comme les quartiles

summarize fq_age, detail

* summarize = sum 

sum fq_age fqweight

* lister toutes les observations d'une variable avec leur label 
list ur

* Afficher toute la base avec browse = br
br 

* browse permet d'afficher des variables specifiées
br FQ_age

* compter les obs totale ou [d'une variable]

count

* compter les obs totale ou [d'une variable] suivant une condition 
count if  ur == 2

* compter les valeurs presentes : on determine d'abord le format des valeurs manquantes (. "" ou autre)
count if current_methodnum_rc !=""

* compter les valeurs manquantes : on determine d'abord le format des valeurs manquantes (. "" ou autre)
count if current_methodnum_rc ==""

*trier par ordre croissant les observations d'une variable [ variables]
sort fq_age

sort fq_age fqweight



*trier par ordre decroissant les observations d'une variable [ variables] NB : le signe (-) est oblg

gsort -fq_age

*Trier par ordre decroissant les variables d'une base
aorder 
order

* tableau de frequences tabulate = tab (applique sur une variable)
tab ur

*************** TABLEAU CROISER ******************
*Tableau brute avec des totaux
tab iud ur,cell

*Profil colonne
tab iud ur,col

*Profil ligne 
tab iud ur,row

/* la difference fondamentale entre summarize et tab : summarize => Quanti; tab => Quali */


****************** CREATION DE VARIABLE **********

*
gen depenses=.

* Remplace si 
replace depenses=FQ_age^2 if ur==2
replace depenses=FQ_age^2 - 300 if ur==1


************** EXERCICE *************************************
gen firt_birth_month2 = 0

replace first_birth_month =. if first_birth_month == 999

* remplacer par 1 si first_birth_month >= 7 et non vide
replace firt_birth_month2 = 1 if first_birth_month>=7 & first_birth_month ~=.

replace firt_birth_month2 = (first_birth_month>=7 & first_birth_month ~=.)

*rsum : somme les colonnes

*************recode***********************************
* Remplace dans la base 999 par .
recode first_birth_month 999 = .

**********CREATION et FONCTION AGREGEE *****************
*creer une variable avec une fonction agregée
egen mean_age = mean(FQ_age)

* creer une variable avec une fonction agregée conditionnelle
egen mean_age_over35 = mean(FQ_age) if over35==1

*order selon la var ur : puis creer la var mean_age_bys ayant pour valeurs la moyenne de FQ_age
bys ur : egen mean_age_bys = mean(FQ_age)


* renommer une variable
rename firt_birth_month2 first_birth_month2

*supprimer une / plusieurs variables
drop depenses

*supprimer les observations(lignes) verifiants la condition
drop if FQ_age == 18

* choisir des variables à garder et le reste est sup
keep FQweight FQmetainstanceID FRS_result EC injectables pill malester femalester current_methodnum_rc current_method first_birth first_birth_month FQmarital_status FQ_age FQSubmissionDate ur

*garder toutes les observations remplissant la condition
keep if FQ_age >=23



*********** EXERCICE ***************************************
* split (RE)

split RE, sparse(" ")



cd "Y:\LPAS_2\Cohorte3\STATA\stataWorkSpace"

********************************************************************************
*********                                                    *******************
********* 07/02/2025 14h                                     *******************
*********                                                    *******************
********************************************************************************
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


recode FQ_age <=25 = 1
**** 6.
save "PMA data for exercise.dta"



********************************************************************************

recode age (min/25=1) (25/45=2) (max/45=3), gen(age_class) 
label var age_class "Age en classe des repondants"
replace 

***********************************************************************
** definition de label [replace si existe dja]
label define yes_no_list 0 "no" 1 "yes", replace

**modifier un label
label define yes_no_list 0 "no" 1 "yes", modify

** afficher les labeles 
labelbook 

** convertir une variable numerique
encode EC gen (EC_num) lab(yes_no_list)

**renommer un label 
labelrename yes_no_list yn_list

***************EXERCICE 5 ******************************************************
***1 
use "Y:\LPAS_2\Cohorte3\STATA\datasets for exercise\PMA data for exercise.dta", replace

***2 Etiquetter 
label var implant "Current_use_of_implant"
label var LAM "Current use of LAM"


**3 Renommage
labelrename 

***4 modifier des labels des observations 

label define marital_status_list -99 "" -88 "" 1 "1. Currently_married" 2 "2. Currently_living_whith_man" 3 "3. Divorced" 4 "4. Widow" 5 "5. Never_married", modify


save "ange_data_07_02.dta"
clear

***************** MACRO ********************************************************

* macro locale
local a = 24
display `a'
capture drop b
gen b = `a'*`a'
display b

* macro globale
global d=2
display $d
capture drop x
gen x = $d ^2 * $d / 2
display x


*Scalaire - chiffre
scalar a=2
display a
capture drop x2
gen x2=a*2
display x2

********************************************************************************
***                                                                           **
***                        08-02-2025                                         **
***                                                                           **
********************************************************************************

**************** EXERCICE 7 ****************************************************

* 1 IMPORTATION ET SAUVEGARDER

import excel "Y:\LPAS_2\Cohorte3\SPSS\data\lari1.xlsx" , sheet("lari1") firstrow clear
save "lari1.dta"
import excel "Y:\LPAS_2\Cohorte3\SPSS\data\lari2.xlsx" , sheet("lari2") firstrow clear
save "lari2.dta"
import excel "Y:\LPAS_2\Cohorte3\SPSS\data\lari3.xlsx" , sheet("lari3") firstrow clear
save "lari3.dta"

import excel "Y:\LPAS_2\Cohorte3\SPSS\data\lari4.xlsx" , sheet("lari4") firstrow clear
save "lari4.dta"

*********** fichier spss *******************************************************
import spss using "Y:\LPAS_2\Cohorte3\SPSS\data\data1.sav", clear
save "data_1.dta"

import spss using "Y:\LPAS_2\Cohorte3\SPSS\data\data2.sav", clear
save "data_2.dta"

import spss using "Y:\LPAS_2\Cohorte3\SPSS\data\data3.sav", clear
save "data_3.dta"

import spss using "Y:\LPAS_2\Cohorte3\SPSS\data\data4.sav", clear
save "data_4.dta"


*** COMBINAISON DE lari4 ET lari3 horizontale
us "lari4.dta" , replace

merge 1:1 ID using "lari3.dta"




/***************** COMBINAISON VERTICALE (SUR LES LIGNES )**********************
**                                                                            **
** condition:les tables doivent avoir les memes colonnes avec les memes types **
** si les tables n'ont pas les memes types,on peut utiliser l'option force (!)**
** la table ouverte est la base et l'autre en second                          **
**                                                                            **
********************************************************************************/
use "data_1.dta", replace

append using "data_2.dta"

/************************* COMBINAISON HORIZONTALE *****************************
**                                                                            **
** 1:1 : necessite une colonne              **
** la table ouverte est la base et l'autre en second  
** meme si                        **
**                                                                            **
*******************************************************************************/
use "data_4.dta", replace

merge 1:1 ID using "lari3.dta"

***********************
drop if ID == "TP010903" | ID == "TP010904"
save  "dt1.dta"

use "lari3.dta"

drop if ID == "TP010906" | ID == "TP010905"
save "dt2.dta"

use "dt1.dta", replace

merge 1:1 ID using "dt2.dta"

*********************************************************exo 7******************

use "Y:\LPAS_2\Cohorte3\STATA\datasets for exercise\PMA data for exercise_appending_2county.dta", clear

use "Y:\LPAS_2\Cohorte3\STATA\datasets for exercise\PMA data for exercise_EAweight.dta", clear

use "Y:\LPAS_2\Cohorte3\STATA\datasets for exercise\PMA data for exercise.dta", clear

************** Format long  ****************************************************
reshape long "la racine de variable", i(i) j(j)

************* format wide 
reshape wide 'nom' i(i) j(j)


****************** fonction d'agregation collapse ****************************************************

use "data_1.dta", clear


*******labelisation *********************
label define sexe_list 1 "Masculin" 2 "Féminin"
label define educ_list 1 "Aucun" 2 "Primaire" 3 "Secondaire" 4 "Superieur"
*** encode converti en numerique et decode converti en chaine***********
encode sexe, gen(sex) 
drop sexe
rename sex sexe
label value sexe sexe_list

encode educ , gen (educe)
drop educ
rename educe educ
label value educ educ_list

********** preserver la base pour la restorer après ************************
preserve

****** collapse prend en argument une fonction d'agregation , la variable est quanti
****** by prend en argument une/+ variable(s) quali 
****principe comme group by (calcul en regroupant selon les vars qual données)
collapse(sum) salaire ,by (sexe educ)

putexcel set "Y:\LPAS_2\Cohorte3\STATA\stataWorkSpace\collapse_value.xlsx", replace



************restorer la base de donnée****************************************
restore

***********a chercher : putexcel et tabout 

********** BOUCLE **************************************************************

******************les boucles for***********************************************
*** foreach : pour chaque 

recode domaine1 (4=.)
encode reseau, gen(reseau1)
recode reseau1 (3=.)

foreach variable in sexe domaine1 reseau1 {
	recode `variable' (7=999)
	tab `variable'
}



**********exercise : forvalue et while *****************************************

********************************************************************************
*******                                                                  *******  
*******        					11/02/2025 : 14h 	       				 *******
*******                                                                  *******
********************************************************************************
cd "Y:\LPAS_2\Cohorte3\STATA\stataWorkSpace"

use "ange_data_07_02.dta", replace

****************BOUCLE while**************************************
summarize FQ_age 
scalar moyen= r(mean) 
local x=1 
local ecartcum=0 
while `x'<=_N { 
	*ecart absolu : ∑|Xi - m|
	local ecartcum= `ecartcum' + abs(FQ_age[`x']-moyen)
	local x=`x'+1 
} 
display `ecartcum'/ _N


local ecartcum = 0  // Initialisation du cumul

forvalues x = 1/`=_N' {  // Boucle sur toutes les observations
    local ecartcum = `ecartcum' + abs(FQ_age[`x'] - moyen)
}


***********************BOUCLE forvalues********************
***** forvalues i=1 (le pas) 4 . par defaut pas = 1 et on note: i=1/4***
***********************************************************
*BOUCLE forevalues : pour des variables numeriques
forvalues i=1/4 { 
    
	*importer et enregistrer des bases en boucle
	import spss using Y:\LPAS_2\Cohorte3\SPSS\data\data`i'.sav, replace 
	* Renommer l'ID en UID dans chaque base et enregistrer
	rename ID UID 
	save Base_`i'.dta,replace 
}


*********************GRAPHIQUES**********************************

                ******HISTOGRAMME**********
*histogram de la var1 selon var2 ()				
hist injectables, fraction

hist FQ_age, fraction

hist FQ_age, width(10) start(5) freq normal

		*******Diagramme en barre**********
* donne la moyenne de la 1ère var par rapport à la 2ème (var Quali) verticale
graph bar FQ_age , over(injectables)

* donne la mediane de la 1ère var par rapport à la 2ème (var Quali) verticale
graph bar (median) FQ_age, over(injectables)

* donne la moyenne de la 1ère var par rapport à la 2ème (var Quali) horizontale
graph hbar FQ_age , over(injectables)


             *******Diagramme en secteur**********
* donne le graph en secteur de la 1ère var par rapport à la 2ème 
graph pie FQ_age, over(injectables)

*donne graph ventilé par la var3 de la var1 en fonction de var2 (qualitative)
graph pie FQ_age, over(injectables) by(FQmarital_status)

			*****Nuage de points***********



use data_1.dta,replace


twoway (scatter salaire cotis)

* avec droite de regression
twoway (scatter salaire cotis) (lfit revenu cotis)



twoway (scatter cotis revenu) (lfit cotis revenu)


        *********Ponderation******************

br