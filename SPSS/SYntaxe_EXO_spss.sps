* Encoding: UTF-8.
/* OUVRIR LA data1
GET
  FILE='Y:\LPAS_2\Cohorte3\SPSS\data\data1.sav'.
DATASET NAME Jeu_de_données2 WINDOW=FRONT.


/* FUSION DE LA BASE data1 ET data2
DATASET ACTIVATE Jeu_de_données2.
ADD FILES /FILE=*
  /FILE='Y:\LPAS_2\Cohorte3\SPSS\data\data2.sav'
  /RENAME (domaine=d0)
  /DROP=d0.
EXECUTE.

/***********************************************************************************
/******* CALCUL DE L'AGE REVOLU ****************************************
/*********** DATE.DMY CONVERTIR EN DATE J-M-A*********************

COMPUTE Age_revolu=DATEDIFF(DATE.DMY(25,01,2025),date,"year").
EXECUTE.


/***********************************************************************************
/******* CALCUL CONDITIONNEE *******************************************
/**********************************************************************************
IF  (salaire<=600000) CNSS=0.075 * salaire.
EXECUTE.

IF  (salaire > 600000) CNSS=45000.
EXECUTE.


/***********************************************************************************
/******* CALCUL SIMPLE ****************************************************
/**********************************************************************************

COMPUTE SALAIRENET=salaire - CNSS - cotis.
EXECUTE.


/***********************************************************************************
/******* RECODAGE : 1 POUR TELMOB ET LE RESTE AUTRE********
/**********************************************************************************

STRING RESEAU1 (A8).
RECODE reseau ('2'='2') ('3'='2') (ELSE='1') INTO RESEAU1.
VARIABLE LABELS  RESEAU1 'RESAEAU USUEL '.
EXECUTE.



/***********************************************************************************
/******* CREATION DE CATEGORIE : CNVAR - *************************
/**********************************************************************************
STRING Categorie (A8).
RECODE Age_revolu (Lowest thru 18='1') (18 thru 35='2') (35 thru Highest='3') INTO Categorie.
VARIABLE LABELS  Categorie 'Grouper en categorie'.
EXECUTE.



/***********************************************************************************
/******* Creation des categories de revenu : regroupement visuel *********
/**********************************************************************************

*Regroupement visuel.
*revenu.
RECODE  revenu (MISSING=COPY) (LO THRU 500000=1) (LO THRU 1000000=2) (LO THRU HI=3) (ELSE=SYSMIS) 
    INTO CtgRevenu.
VARIABLE LABELS  CtgRevenu 'Revenu mensuel du client categorisé en 3 classes'.
FORMATS  CtgRevenu (F5.0).
VALUE LABELS  CtgRevenu 1 'Revenu bas' 2 'Revenu Moyen' 3 'Revenu élévé'.
VARIABLE LEVEL  CtgRevenu (ORDINAL).
EXECUTE.


/***********************************************************************************
/******* Creation des categories de revenu : cnvar EN CONSIDERANT LES MISS COMME : MOYEN *********
/**********************************************************************************

STRING CtgRevenu (A8).
RECODE revenu (SYSMIS='2') (Lowest thru 500000='1') (500000 thru 1000000='2') (1000000 thru 
    Highest='3') INTO CtgRevenu.
VARIABLE LABELS  CtgRevenu 'Revenu catégorisé'.
EXECUTE.


/***********************************************************************************
/******* PARTIE 2 : STATISTIQUES DESC                                *********
/**********************************************************************************



/***********************************************************************************
/******* repartition selon le domaine  *********
/**********************************************************************************

FREQUENCIES VARIABLES=domaine
  /STATISTICS=SUM
  /ORDER=ANALYSIS.

/***********************************************************************************
/******* tableau plat : à une seule var : rep selon info *********
/**********************************************************************************

FREQUENCIES VARIABLES=info
  /STATISTICS=SUM
  /ORDER=ANALYSIS.

/***********************************************************************************
/******* tableau plat: selon le niveau d'educt*********
/**********************************************************************************


FREQUENCIES VARIABLES=educ
  /STATISTICS=SUM
  /ORDER=ANALYSIS.

/***********************************************************************************
/******* des stat essentielles des var revenu et age: moy, ecartt, min,max, var etc *********
/**********************************************************************************

BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=revenu Age_revolu 
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
DESCRIPTIVES VARIABLES=revenu Age_revolu
  /STATISTICS=MEAN SUM STDDEV VARIANCE RANGE MIN MAX.

RECODE sexe (MISSING='1').
EXECUTE.

/***********************************************************************************
/******* croisement entre sexe et region : stat-croise *********
/**********************************************************************************

CROSSTABS
  /TABLES=sexe BY region
  /FORMAT=AVALUE TABLES
  /CELLS=ROW 
  /COUNT ROUND CELL.

/***********************************************************************************
/******* Autre facon : tableau croisé entre sexe et region *********
/**********************************************************************************


* Tableaux personnalisés.
CTABLES
  /VLABELS VARIABLES=sexe region DISPLAY=LABEL
  /TABLE sexe [COUNT F40.0, ROWPCT.COUNT PCT40.1, ROWPCT.TOTALN PCT40.1, COLPCT.COUNT PCT40.1, 
    COLPCT.TOTALN PCT40.1] BY region
  /CATEGORIES VARIABLES=sexe ['2', '1', OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=region ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CRITERIA CILEVEL=95.

/***********************************************************************************
/******* profil ligne: stat  - croisé  *********
/**********************************************************************************

CROSSTABS
  /TABLES=sexe BY sitmat
  /FORMAT=AVALUE TABLES
  /CELLS=ROW 
  /COUNT ROUND CELL.

/***********************************************************************************
/******* profil ligne: tableau perso  *********
/**********************************************************************************

* Tableaux personnalisés.
CTABLES
  /VLABELS VARIABLES=sexe sitmat DISPLAY=LABEL
  /TABLE sexe [C][ROWPCT.COUNT PCT40.1] BY sitmat [C]
  /CATEGORIES VARIABLES=sexe ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=sitmat ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /CRITERIA CILEVEL=95.


/***********************************************************************************
/******* profil colonne: tableau perso  *********
/**********************************************************************************

* Tableaux personnalisés.
CTABLES
  /VLABELS VARIABLES=sexe sitmat DISPLAY=LABEL
  /TABLE sexe [C][COLPCT.COUNT PCT40.1] BY sitmat [C]
  /CATEGORIES VARIABLES=sexe ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=sitmat ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CRITERIA CILEVEL=95.

/***********************************************************************************
/*******moyenne, max etc par categorie: analys-Compare moyenne -moyenne*********
/**********************************************************************************


/***********************************************************************************
/*******moyenne: desc-descriptive *********
/**********************************************************************************

MEANS TABLES=revenu BY Categorie
  /CELLS=MEAN COUNT STDDEV.

DESCRIPTIVES VARIABLES=CNSS cotis
  /STATISTICS=MEAN.

/***********************************************************************************
/*******max age par ethnie: analys-Compare moyenne -moyenne*********
/**********************************************************************************


MEANS TABLES=Age_revolu BY ethnie
  /CELLS=MAX.

/***********************************************************************************
/*******total revenu par sexe: analys-Compare moyenne -moyenne*********
/**********************************************************************************


MEANS TABLES=revenu BY sexe
  /CELLS=SUM.
/***********************************************************************************
/*******proportion des femmes vivant dans les cascades: parmi pop totale nationale : prof ligne*********
/**********************************************************************************


* Tableaux personnalisés.
CTABLES
  /VLABELS VARIABLES=sexe region DISPLAY=LABEL
  /TABLE sexe [C][ROWPCT.COUNT PCT40.1] BY region [C]
  /CATEGORIES VARIABLES=sexe region ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /CRITERIA CILEVEL=95.


/***********************************************************************************
/*******La prop des clients du cascade qui sont des femmes: profil col*********
/**********************************************************************************

* Tableaux personnalisés.
CTABLES
  /VLABELS VARIABLES=sexe region DISPLAY=LABEL
  /TABLE sexe [C][COLPCT.COUNT PCT40.1] BY region [C]
  /CATEGORIES VARIABLES=sexe ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=region ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CRITERIA CILEVEL=95.

/***********************************************************************************
/*******Graphique empiler : var principale en X; var empile*********
/**********************************************************************************


* Générateur de graphiques.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=reseau COUNT()[name="COUNT"] ethnie MISSING=LISTWISE 
    REPORTMISSING=YES
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: reseau=col(source(s), name("reseau"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  DATA: ethnie=col(source(s), name("ethnie"), unit.category())
  GUIDE: axis(dim(1), label("Reseau de télécommunication du client"))
  GUIDE: axis(dim(2), label("Effectif"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Ethnie du client"))
  GUIDE: text.title(label("Diagramme en Barres : superposé Effectif de Reseau de ",
    "télécommunication du client par Ethnie du client"))
  SCALE: cat(dim(1), include("1", "2", "3"))
  SCALE: linear(dim(2), include(0))
  SCALE: cat(aesthetic(aesthetic.color.interior), include("1", "2", "3", "4", "5", "6", "7", 
    "8", "9", "10"))
  ELEMENT: interval.stack(position(reseau*COUNT), color.interior(ethnie), 
    shape.interior(shape.square))
END GPL.


/***********************************************************************************
/*******Graphique juxtapose : categorie et catrevenu*********
/**********************************************************************************


DATASET ACTIVATE Jeu_de_données1.
* Générateur de graphiques.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Categorie COUNT()[name="COUNT"] CtgRevenu 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Categorie=col(source(s), name("Categorie"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  DATA: CtgRevenu=col(source(s), name("CtgRevenu"), unit.category())
  COORD: rect(dim(1,2), cluster(3,0))
  GUIDE: axis(dim(3), label("Grouper en categorie"))
  GUIDE: axis(dim(2), label("Pourcentage"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Revenu catégorisé"))
  GUIDE: text.title(label("Diagramme en Barres : juxtaposé Pourcentage de Grouper en categorie ",
    "par Revenu catégorisé"))
  SCALE: cat(dim(3), include("1", "2", "3"))
  SCALE: linear(dim(2), include(0))
  SCALE: cat(aesthetic(aesthetic.color.interior), include("1", "2", "3"))
  SCALE: cat(dim(1), include("1", "2", "3"))
  ELEMENT: interval(position(summary.percent(CtgRevenu*COUNT*Categorie, base.all(acrossPanels()))), 
    color.interior(CtgRevenu), shape.interior(shape.square))
END GPL.

/***********************************************************************************
/******correlation entre revenu et age : anal-correlation-bivar-*********
/**********************************************************************************


CORRELATIONS
  /VARIABLES=revenu Age_revolu
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.




CORRELATIONS
  /VARIABLES=CNSS salaire
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/***********************************************************************************
/*******Test de khi-deux: an-desc-stat-khi*********
/**********************************************************************************


CROSSTABS
  /TABLES=educ BY sexe
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.


/***********************************************************************************
/******* Profil colonne  *********
/**********************************************************************************

* Tableaux personnalisés.
CTABLES
  /VLABELS VARIABLES=sitmat ethnie DISPLAY=LABEL
  /TABLE sitmat [C] BY ethnie [C][COLPCT.COUNT PCT40.1]
  /CATEGORIES VARIABLES=sitmat ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=ethnie ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CRITERIA CILEVEL=95.

  
/***********************************************************************************
/******* calcul de moyenne et ecart-type: CV = (ecart/moyenne) à calculer manuellement*********
/**********************************************************************************

DESCRIPTIVES VARIABLES=revenu salaire
  /STATISTICS=MEAN STDDEV.



COMPUTE age_week=DATEDIFF(DATE.DMY(25,01,2025),date,"week").
EXECUTE.







STRING categorie (A8).
RECODE age (Lowest thru 17='1') (18 thru 35='2') (35 thru Highest='3') INTO categorie.
VARIABLE LABELS  categorie "les categories d'age".
EXECUTE.
