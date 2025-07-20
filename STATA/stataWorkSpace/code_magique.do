
cd "Y:\LPAS_2\Devoir SPSS_2023"

******************************I.STATA1********************

********************.a) Importation des bases et selection des variables recommandées************

use "BASE1.dta" ,clear
keep female_ID FQmetainstanceID FQavailable FQ_age FQmarital_status ur ethnicity ever_partner birth_events school school_left_age school_left_why religion mcp cp tcp 
save "base1",replace

use "BASE2.dta" ,clear
keep female_ID FQmetainstanceID FQavailable FQ_age FQmarital_status ur ethnicity ever_partner birth_events school school_left_age school_left_why religion mcp cp tcp 
save "base2",replace

use "BASE3.dta" ,clear
keep female_ID FQmetainstanceID FQavailable FQ_age FQmarital_status ur ethnicity ever_partner birth_events school school_left_age school_left_why religion mcp cp tcp 
save "base3",replace


*********1.b.De constituer une base en format long contenant ces variables sélectionnées et portant exclusivement sur les individus qui sont à la fois dans les trois base

use "base1.dta",clear
append using "base2.dta" "base3.dta"
save "base_format_long.dta", replace

****Gardons uniquement les individus se retrouvant a la fois dans les trois bases***

use "base_format_long.dta", clear 
sort female_ID

****créons une variable de sequence et sommons par identifiant***
egen n_var = seq() , by(female_ID)
egen   som = sum(n_var),by(female_ID) // variable sommant des sequence par identifiant
****Gardons uniquement les individus se retrouvant a la fois dans les trois bases**

keep if som ==6 
drop if female_ID == ""

*********Completons la variable ethnicity dans la base fusionnée contenant uniquement les individus qui sont à la fois dans les trois base

joinby female_ID using "base1.dta" , update unmatched(none)
keep(female_ID FQmetainstanceID FQavailable FQ_age school school_left_age school_left_why FQmarital_status ever_partner birth_events ur ethnicity religion cp mcp tcp)

******d. Construire l’indicateur «INDICE » qui est une moyenne non pondérée de ces indicateurs
egen INDICE =rowmean(cp mcp tcp)
****e.Créer ces variables regroupées sur la base des variables d’origines :
******** Créer une variable regroupée de la variable « FQ_age » nommée « AGEGR »*********
recode FQ_age (15/25=1) (25/35=2) (35/45=3) (45/49=4), gen(AGEGR)
label define AGEGR 1"]15,25]" 2"]25,35]" 3"]35,45]" 4"]45,49]"
label value AGEGR AGEGR 
*****Créer une variable regroupée de la variable « birth_events » nommée « parité » *****
recode birth_events (0=0) (1/13=1),gen(parite)
label define parite 0"Aucun" 1"Au moins un enfant"
label value parite parite
******* Créer une variable regroupée de la variable «FQmarital_status» nommée « Statut »****
recode FQmarital_status (1/2 =1) (3/5=0), gen(statut)
label define statut 1" union" 0"Pas en union"
label value statut statut

*******************************II.STATA2***************************
clear all 
cd "C:\Users\USER\Desktop\Tao_Prénom\BASES\STATA2"
use "BASE1", clear

*************a.incrémenter les observations à l'aide d'une boucle***********
*** Incrémentation des variables Arrondissement à ZD ***
sort IDindv
quietly foreach var in Arrondissement quartier Secteur ZD {
	replace `var' = `var'[_n-1] if `var'==" "
}

******Incrémentation de la variable Poids
quietly forvalues i = 1/478{
	replace Poids = Poids[_n-1] if Poids ==.
}

		***b.Ajoutons la deuxieme base ***
sort IDindv
***Fusion des 2 bases
**Fusion en conservant que les données de BASE correspondante
merge 1:1 IDindv using "BASE2.dta", keep(match) nogenerate
	
* c) Définir le seuil de pauvreté (Z)

* Définition de la fonction de profondeur de la pauvreté (P_α)
program P_α
	args poids dep_total	//Définition des paramètres de la fonction
	local Z = 45
	scalar P = (1 / (sum(`poids')) * sum(`poids'*(`dep_total' / `Z')))
	display "P_α = " P
end
* Afficher le résultat
P_α Poids DEPTOT

* Calcul la moyenne pondérée de l'indicateur de bien-être (consommation)
scalar mu = sum(consommation * Poids) / sum(Poids)
gen somdifxi_j = 0

* Calcul l'indice d'inégalité (G)
program G
	args nomb x u // Les arguments de la fonction: m = n, x = consommation et u = mu
	quietly forvalues k = 1/478 {
        replace somdifxi_j = abs(`x'[_n] - `x'[_n+1]) // valeur_absolue(xi-xj)
    }
	scalar G_I = somdifxi_j / (2 * (`nomb'^2) * `u') //Calcul de G
	display "G = " G_I	//Affichage du résultat obtenu
end
local m = _N
G `m' consommation mu //Exécution du G

***************************FIN*****************************************



