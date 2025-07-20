/******************21-02-2025***************************************************
*********** EXPERT YAMEOGO ****************************************************
***** Devoir 2023 *************************************************************
********************************************************************************
** source  */
cd "Y:\LPAS_2\Devoir SPSS_2023\STATA1"

** Use

forvalues num=1/3  {
	
	*import 
	use BASE`num'.dta , replace
	* garder quelques var
	keep female_ID FQmetainstanceID FQavailable FQ_age school school_left_age school_left_why FQmarital_status ever_partner birth_events ur ethnicity religion cp mcp tcp

save BASE_TRAITER_`num'.dta, replace
}

/*b. ''''' Pour merger deux base, il faut determiner la relation qui lie les deux
1:1 ; merge 1:1; 1:plusieurs merge 1:m ; plusieurs à 1 merge m:1; 
pour verifier : isid nom_id_commun_au_deux_bases : si rien alors pas de duplication
autre methode : duplicates report nom_id_commun_au_deux_bases */

forvalues i=1/3 {
	use BASE_TRAITER_`i'.dta , replace
	duplicates report female_ID
}

*** base1 à base2 : merge 1:1  nom_id_commun_au_deux_bases base_deux , base3 1: plusieurs

us BASE_TRAITER_1, replace
merge 1:1 female_ID using BASE_TRAITER_2

*drop if _merge == 1
rename _merge _merge1

merge 1:m female_ID using BASE_TRAITER_3
*drop if _merge == 1
rename _merge _merge2

/*****************Question b ************************************************/


rename mcp mcp1
rename tcp tcp1
rename cp cp1

********************************************************************
/************Formant large au format long ******************************
** reshape long school school_left_age, i(female_ID FQmetainstanceID) j(newVar) **********


Variables nécessaires pour reshape long

Pour utiliser reshape long, vous devez avoir :

    Variables d'identification (i()) : Ce sont des variables qui identifient de manière unique chaque ligne dans le format large. Par exemple, female_ID et FQmetainstanceID.

    Variables répétées (stub) : Ce sont les variables qui seront transformées en format long. Elles doivent avoir un suffixe ou un préfixe commun (par exemple, school1, school2, school3).

    Variable de catégorie (j()) : Cette variable sera créée pour stocker les suffixes des variables répétées (par exemple, 1, 2, 3 pour school1, school2, school3).
	
	***format large compatible à la methode reshape long *******
	
female_ID	FQmetainstanceID mcp1  mcp2	tcp1  tcp2	cp1 	cp2
  1			   101				10	12	 5	   6	  3	     4
	
	**resultat en format long***
	
	female_ID	FQmetainstanceID	newVar	mcp	tcp	  cp
		1		   101			    	1	10	 5 	  3
		
********************************************************************/

**********************************************************************
/************* Formant long à format large ****************************
***** reshape wide mcp tcp cp, i(female_ID FQmetainstanceID) j(newVar) ***

** newVar contient des categories comme 1,2,3 ****

Variables nécessaires pour reshape wide

Pour utiliser reshape wide, vous devez avoir :

    Variables d'identification (i()) : Ce sont des variables qui identifient de manière unique chaque unité d'analyse. Par exemple, female_ID et FQmetainstanceID.

    Variable de catégorie (j()) : Cette variable indique la catégorie ou la période pour chaque observation (par exemple, newVar avec des valeurs 1, 2, etc.).

    Variables à transformer (stub) : Ce sont les variables qui seront étalées en colonnes séparées pour chaque catégorie ou période (par exemple, mcp, tcp, cp).
	
	**format long
	female_ID	FQmetainstanceID	newVar	mcp	tcp	  cp
		1		   101			    	1	10	 5 	  3
		
	*** resultat en format large :
	
	female_ID	FQmetainstanceID	mcp1	mcp2	tcp1	tcp2	cp1	cp2
		1			101				10		 12		  5		 6		  3	 4
******************************************************************************************************************************************/
	

	
us BASE_TRAITER_1, replace

*** 2. Formant long avec append
append using "BASE_TRAITER_2.dta" "BASE_TRAITER_3.dta"
save "base_format_long.dta", replace

*** 3 . Remplacer les valeurs manquantes de la base master par les valeurs de la base1

/* *************** Utilisation de la jointure ******
joinby nom_id_commun_au_deux_bases using "nom_base2.dta", update unmatched(none)

==> update : Si une valeur est manquante dans la base active, elle sera remplie avec la valeur correspondante de la base using.
Si une variable a déjà une valeur dans la base active, elle ne sera pas modifiée (même si une valeur différente existe dans la base using).
Les valeurs de la base using ne sont utilisées que pour compléter les données manquantes dans la base active.

==> unmatched (option): précise le type de jointure
	-Joint left (toute la base1 est conservée) : option = master ie la base active
	-Joint right (toute la base2 est conservée) : option = using ie la base2
	-inner Joint (les valeurs communes aux deux bases) : option = none
	-full Joint  (toutes les valeurs sont conservées) : option = both ie la base active
************************************************/
use base_format_long.dta, replace

joinby female_ID using BASE1.dta, update unmatched(none)
keep female_ID FQmetainstanceID FQavailable FQ_age school school_left_age school_left_why FQmarital_status ever_partner birth_events ur ethnicity religion cp mcp tcp

*************** 4. Indice *******************
egen INDICE4 = rowmean(cp mcp tcp)


************** e. classe  ***************
* ==> AGEGR

recode FQ_age ( 16/25 =1 ) (26 /35 =2 ) ( 36/ 45= 3) ( 46/49 = 4), gen(AGEGR)

label define AGEGR_VAR_LIST 1 "]15, 25[" 2 "]25 , 35]" 3 "]35, 45]" 4 "]45, 49]"

label values AGEGR AGEGR_VAR_LIST

* ==> parite

gen parite = " "
replace parite = "Aucun" if birth_events == 0
replace parite = "Au moins un enfant" if birth_events>0

* ==> Statut
recode FQmarital_status (1 2 = 1 ) (3 4 5 -99 = 0)

** Autrement avec replace
replace FQmarital_status = 1 if FQmarital_status == 1 | FQmarital_status ==2
replace FQmarital_status = 0 if FQmarital_status != 1

label define FQmarital_status_list 1 "en union" 0 "Pas en union", replace

****************II STATA2 **************************
cd "Y:\LPAS_2\Devoir SPSS_2023\STATA2"

use BASE1.dta , replace

*************************


levelsof ID, local(id_list)

foreach CM_ID of local id_list {
    foreach current_colonne in Arrondissement quartier Secteur ZD {
        // Récupérer la première valeur (pour les variables string)
        quietly list `current_colonne' if ID == `CM_ID'
        local CM_valeur = `current_colonne'[1]  // Prend la première valeur

        // Appliquer cette valeur à toutes les occurrences de l'ID
	
        replace `current_colonne' = "`CM_valeur'" if ID == `CM_ID'
    }
}

use BASE1.dta, replace
sort ID IDindv
quietly foreach var in Arrondissement quartier Secteur ZD Poids {
	
	if "`var'" == "Poids" {
		replace Poids = Poids[_n-1] if Poids ==.
	}
	
	if "`var'" != "Poids" {
		replace `var' = `var'[_n-1] if `var'==" " 
	}	
}


********** b. fusion *******************


merge 1:1 IDindv using BASE2.dta 


***** profondeur de la pauvreté

local Z = 45
local N = 0
local w=0
local i = 1
while `i' <= _N {
	local N = `N'+ Poids[`i']*DEPTOT[`i']
	local w = `w'+Poids[`i']
	local i = `i'+1
}

local Pa = `N'/ (`w' * `Z')
display  " Pa = " `Pa'

*****indice d'inegalité ************



local i = 1
local num = 0
local j =1

while `i' <= _N {

	while `j' <= _N{
		local num = `num'+ abs(consommation[`i']-consommation[`j'])
		local j = `j'+1
	}
	local i = `i'+1
}
di `num'

local µ=sum(Poids*consommation)/sum(Poids)

local _2nµ = 2*_N^2*`µ'
di `_2nµ'

local G = `num'/`_2nµ'

display "l'indice = " `G'


***********COEF DE CORRELATION *************************************************