## ============= 14-05-2025 ===================================

# TP variables qualtitatives

#On souhaite analyser l’effet de l’âge, du niveau d’étude, de la pratique religieuse, et du nombre moyen d’heures passées à regarder la télévision par jour sur le fait de pratiquer un sport. 

#Question 1 : 
#Charger le jeu de données histoire de vie 2003 hdv2003 et vous sélectionnerez les variables d'intérêt dans un objet que vous 'appellerez df

library(questionr)
data("hdv2003")

str(hdv2003)

df <- hdv2003[c("age","sexe","nivetud","relig","heures.tv","sport")]


#Question 2 
#Quelle est la variable binaire?

#La variable binaire est 'sport' qui est oui/non
#Quelles sont les variables explicvatives? Quelle est la nature de chaque variable?
# les variables explicatives sont l’âge : entier, du niveau d’étude:Factor, de la pratique religieuse: factor, et du nombre moyen d’heures passées:numeric; à regarder la télévision par jour sur le fait de pratiquer un sport. 

  ##==== Tabulation ============
#1 . Table 
table(df$sport)

# 2 freq
freq(df$sexe)

# par defaut , pour chaque la premiere modalité est la modalite de reference
# choix des modalitées de reference
relevel(df$sexe,ref = "Homme")
relevel(df$sport,ref = "Oui")


# statistique descriptive de age
summary(df$age)

# recodage de la variable age
df$group_age <- cut(df$age,
   include.lowest = TRUE,
   right = TRUE,
   dig.lab = 3,
   breaks = c(16,25,45,65,100 ))
# icut() permet de recoder une variable avec un fenetre 
icut()

summary(df$group_age)

# recodage de la variable niveau d'étude 


df$etud <- as.character(df$nivetud)
df$etud[df$nivetud =="N'a jamais fait d'etudes"] <- "Primaire"
df$etud[df$nivetud =="A arrete ses etudes, avant la derniere annee d'etudes primaires"] <- "Primaire"
df$etud[df$nivetud =="Derniere annee d'etudes primaires"] <- "Primaire"
df$etud[df$nivetud =="1er cycle" ]<- "Secondaire"
df$etud[df$nivetud =="2eme cycle" ]<- "Secondaire"
df$etud[df$nivetud =="Enseignement technique ou professionnel court"] <- "Technique/Professionnel"
df$etud[df$nivetud =="Enseignement technique ou professionnel long"] <- "Technique/Professionnel"
df$etud[df$nivetud =="Enseignement superieur y compris technique superieur"] <- "Superieur"
df$etud[is.na(df$nivetud)]<- "Manquant"

# tabulation

table(df$etud,useNA = "always")

# ordonner
df$etud <- factor(df$etud,
levels = c("Primaire", "Secondaire", "Superieur","Technique/Professionnel",  "Manquant"))

# ou l'option manuelle
iorder(df,etud)


## Réordonnancement de df$etud
df$etud <- factor(df$etud,
  levels = c(
    "Primaire", "Secondaire", "Superieur", "Technique/Professionnel",
    "Manquant"
  )
)



# Regression logistique binaire

#GLM ('generalized linear models')


#reg <- glm(sport ~ sexe + groupe_age + etud + relig + heures.tv, data = d, family
           # Les options disponibles de l'argument family sont : 
           # # binomial(link = "logit")
           # # gaussian(link = "identity")
           # # Gamma(link = "inverse")
           # # inverse.gaussian(link = "1/mu^2")
           # # poisson(link = "log")# # 
          # quasi(link = "identity", variance = "constant")# # 
          # quasibinomial(link = "logit")
           # # quasipoisson(link = "log")
           
          # = binomial(logit))

reg <- glm(sport ~ sexe + group_age + etud + relig + heures.tv, data = df, family = binomial(logit))

summary(reg)


library(labelled)
look_for(df)



reg3 <- glm(sport ~ sexe + group_age + etud  + heures.tv, data = df, family = binomial(logit))

summary(reg3)

# Pouvoir explicatif du modèle

library(DescTools)

PseudoR2(reg,c("McFadden","Efron"))



"===============16-05-2025===================================================================="




"Télécharger les données présentes sur ce lien : 
  https://drive.google.com/drive/folders/1-kL1_ujQp2iWMl-Dj6zWZk3HHHR6mm7x?usp=sharing"""




#                                            valeurs réelles 
# 
#  valeurs prédites              Negative : 0                  Positive : 1
# 
# Negative : 0                    Vrai négatif  (True negative)               Faux négatif (False négative)
# 
# 
# Positive : 1                      Faux positif    (False positive)              Vrai positif (True positive)

# Les 4 cas possibles lors d’une prédiction binaire telle qu’une grossesse (0 et 1) sont :

#  a) Vrai négatif (True Negative) : 
#   La prédiction est négative et c’est la réalité.
# Le médecin prédit que la patiente n’est pas enceinte, ce qui est vrai.

# b) Faux négatif (False negative), 

#   La prédiction est négative mais ce n’est pas la réalité.
# Le médecin prédit que la patiente n’est pas enceinte alors qu’elle l’est


# c) Faux positif (False positive)
#   La prédiction est positive mais ce n’est pas la réalité.
# Le médecin prédit que la patiente est enceinte alors qu’elle ne l’est pas.

#d)  Vrai positif (True Positive) :
#   La prédiction est positive et c’est la réalité.
# Le médecin prédit que la patiente est enceinte, ce qui est vrai.


# on a 5 prinicpaux indicateurs ; 

# taux d'erreur est égal au nombre de mauvais classement rapporté à l'effectif total : 

# Le taux de succès correspond à la probabilité de bon classement du modèle, c'est le complémentaire à 1 du taux d'erreur

# précision : La précision indique la proportion de vrais positifs parmi les individus qui ont été classés positifs

# sensibilité :le taux de vrais positifs parmi les individus réellement positifs

#spécificité : indique la proportion de négatifs parmi les individus qui ne sont pas positifs

library(caret)
?predict

predites<-predict(reg,type="response",newdata = df)

Head(predites)

head(predites)      

"1                                2          3                    4              5                6 
0.60374542 0.72961416 0.16333038 0.68964049 0.07102984 0.34079289"

table(predites,useNA = "always")

table(predites>0.5,df$sport)


#              Non  Oui
# FALSE   1090  388
# TRUE     185  332

"Calculer le taux d'erreur de notre modèle et dire si le modèle prédit bien le fait de pratiquer du sport.

Un taux de 28% est  bien ou pas? 

# Véritable réponse : à quoi comparer cette valeur? On la compare au taux de mauvais classement du modèle nul 

regvide <- glm(sport ~1, data = d, family= binomial(logit))

#              Non  Oui
# FALSE   1277  723    " 

predites_vide<-predict(regvide,type="response",newdata = d)

# C'est quoi le test  de Hosmer et Lemeshow (1989) ? 
  
  #H0 : l'ajustement du modèle aux données est bon : il n'existe pas différences significatives entre les valeurs observées  et les valeurs prédites pour chaque sujet. 
  
  # H1 : l'ajustement du modèle est mauvais : il  existe des différences significatives entre les valeurs observées et les valeurs prédites pour chaque sujet. 
  
  library(performance)

performance_hosmer(reg)


## 3.4 Courbe ROC

# Since we don’t usually know the probability cutoff in advance, the ROC curve is typically used to plot  # the true positive rate (or sensitivity on y-axis) against 
#the false positive rate (or “1-specificity” on x-axis) at all possible probability cutoffs.


# Another visual representation of the ROC plot is to simply display the sensitive against the specificity.


# The Area Under the Curve (AUC) summarizes the overall performance of the classifier, 
# over all possible probability cutoffs. It represents the ability of a classification 
# algorithm to distinguish 1s from 0s (i.e, events from non-events or positives from negatives).

library(pROC)

res.roc <- roc(df$sport, predites)

plot.roc(res.roc, print.auc = TRUE)

# Afficher les odds-ratio, et iidetifier les variables qui ont un effet significatif
# Procéder à l'interprétation





reg <- glm(sport ~ sexe + group_age + etud + relig + heures.tv, 
           data = df, 
           family = binomial(link = "logit"))  

reg <- glm(sport ~ sexe + group_age + etud + relig + heures.tv, data = df, family
           = binomial(logit))

# interpreter la signitificativité et l'effet (+ ou -) mais pas l'orde d'ampleur
summary(reg)

# les coefficient et les intervalles de conf
library(broom)

tidy(reg, conf.int = TRUE, exponentiate = TRUE)



"========== Analyse de l'ampleur"



# install.packages("broom.helpers")


# option 1
library(questionr)
odds.ratio(reg, level = 0.95)

# option 2 plus intuitive
library(gtsummary)
#install.packages("gtsummary")

tbl_regression(reg, exponentiate = TRUE)


# qui donne plus de details
library(broom.helpers)

broom.helpers::tidy_plus_plus(reg, exponentiate = TRUE)


# pour analyse graphique
library(GGally)
ggcoef_model(reg, exponentiate = TRUE)


# autre methode pour visualiser
install.packages("forestmodel")
library(forestmodel)

forest_model(reg)




#  identifier les variables qui ont un effet significatif

# Procéder à l'interprétation 


# Les p-values associées aux odds ratios nous indique si un odd ratio est significativement
#différent de 1,  par rapport à la modalité de référence. Mais cela n’indique pas si
#globalement une variable a un effet  significatif sur le modèle. Pour tester l’effet global
#sur un modèle, on peut avoir recours à la fonction # drop1 . Cette dernière va tour à tour
#supprimer chaque variable du modèle et réaliser une analyse de # variance (ANOVA, voir 
#fonction anova ) pour voir si la variance change significativement.


# la significativité des variables
library(car)
car::Anova(reg)




# sélection de modèle
#option 1
reg2 <- step(reg)

#option 2
library(MASS)
reg2bis <- stepAIC(reg)


# comparaison des deux deux modèle
## HO : difference entre les modèles (p-value >seuil) 

anova(reg, reg2bis, test = "Chisq")



# Procéder à l'interprétation 

"=======================================Fin Séance ============================="

"   =============19-05-2025  ======="

# Régression multinomiale

"Une banque met à disposition de ses clients 3 formules de crédit (A, B et
                                                                  C). Le conseiller doit faire attention lorsqu'il est face au client. S'il met en avant une formule inadaptée,
il risque de le décourager et de le voir partir. L'objectif de l'étude est de cibler, à partir de données que
l'on peut facilement recueillir [l'âge (quantitatif), le sexe et le revenu par tête du
ménage (quantitatif)], la formule que l'on doit proposer en priorité
"

install.packages('readxl') 
library(readxl)

#import Excel file into R



assurance<-read_excel("assurance.xlsx")

"Charger le jeu de données ; 
Donner la répartition des types de prêt? 
  Changer la nature des variables si cela est nécessaie
Pour la variable type.pret, je veux que la référence soit le crédit "

assurance$type.pret <- as.factor(assurance$type.pret)
summary(assurance$type.pret)
class(assurance$sexe)
assurance$sexe <- as.factor(assurance$sexe)
levels(assurance$sexe)
assurance$type.pret <- relevel(assurance$type.pret,ref="C")
assurance$rev.tete<-as.numeric(assurance$rev.tete)

# Regression logistique multinomiale avec le package nnet
library(nnet)
?multinom

regm = multinom(type.pret ~., data= assurance, model = TRUE)
summary(regm)

"
Coefficients:
  (Intercept)        age      sexe1   rev.tete
A    21.01159 -0.4679095  0.1653907 -0.9283279
B   -25.91736  0.2823443 -4.8893917  1.5394654

* Plus le revenu du menage est élévé, mois il prefere la formule A par rapport à C
ie qu'il prefere C par rapport à A

* les personnes agés ont tendance à prendre C par rapport à A
* par rapport aux femmes, les hommes ont tendance à preferer A que C

** les femmes ont tendance à prendre B que C comparativement aux hommes
** les personnes agés preferent B que C
** les revenus élévés preferent B par rapport à C
"

#pseudoR2 du Modèle
library(DescTools)

PseudoR2(regm,c("McFadden","Efron"))

" Pour verifier la qualité du modèle, on le compare au modèle sans variable

* Le modèle Vide, on considère que les autres variables est 1"
#LRT test

regs<-multinom(type.pret~1 , data = assurance, model=TRUE)
summary(regs)

'*LR = Residual Deviance du modele vide -Residual Deviance du modele contraint
 * On effectue un test de Khi deux
 * ddl = (k-1)*j où k est le nombre de modalités de la variable dependante 
  j le nombre de variables explicatives sans la constante
  k=2=3-1, j=3 ddl = 6
'

LR = 65.91674 -18.38268 
 " LR est la statistique que l'on compare avec la statist de khi-deux a 6 ddl"

# matrix  de confusion pour voir le pouvoir de prediction
 
 library(caret)
 
 table(predict(regm, newdata = assurance), assurance$type.pret)
 
" Le taux de succes 20/30 : Pour un nouveau client , il y a 83,33% de le dirigé vers la bonne formule"
 
 # Test de significativité des paramètres
library(car)
car::Anova(regm)

tbl_regression(regm, exponentiate = TRUE)

library(MASS)
reg2bis <- stepAIC(regm)


tbl_regression(reg2bis, exponentiate = TRUE)

reg2 <- step(regm)




