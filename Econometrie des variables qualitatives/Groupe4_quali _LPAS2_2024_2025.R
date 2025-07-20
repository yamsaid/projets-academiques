#############################################################################################################################################################################
#                                                                                                                                                                           #
#                                          ECONOMETRIE DES VARIABLES QUALITATIVES                                                                                           #
#                                                                                                                                                                           #
#                             Régression logistique multinomiale de la variable type de logement                                                                            #
#                                                                                                                                                                           #                                                                                                                                                                            #
#                                                                                                                                                                           #
#############################################################################################################################################################################








############################## Installation et chargement des packages nécéssaires ##########################################################################################

# install.packages("feather")
# install.packages("dplyr")
# install.packages("corrplot")
# install.packages("car")
# install.packages("nnet")
# install.packages("VIM")
# install.packages("mice")
# install.packages("lmtest")
# install.packages("naniar")
# install.packages("FactoMineR")
# install.packages("factoextra")
# install.packages("pscl")
# install.packages("knitr")
# install.packages("Hmisc")
# install.packages("caret")
# install.packages("tidyverse")
library(feather)
library(dplyr)
library(corrplot)
library(car)
library(nnet)
library(VIM)
library(mice)
library(lmtest)
library(naniar)
library(FactoMineR)
library(factoextra)
library(pscl)
library(knitr)
library(Hmisc)
library(caret)
library(tidyverse)

############################## Importation du jeu de données ################################################################################################################

############ Chargement des données

#Répertoire de travail:  setwd("C:/Users/HP/Desktop/Projet_eco_quali/groupe4_quali _LPAS2_2024_2025")
data <- read_feather("base_projet_quali.feather")

########### Filtration des observations en fonction du milieu urbain
# En effet,l' entreprise immobilière souhaite mettre à disposition de ménages,  différents types de logements en milieu urbain. Les données qui
# nous concernent sont donc celles qui ont un lien avec le milieu urbain (qui correspond à la modalité 1 dans notre variable milieu). La variable data_urban 
# ainsi créee sélectionne uniquemement les observations du milieu urbain pour notre étude.

data_urban <- data %>% filter(milieu == 1)

###############################           Analyse préliminaire         ###############################
######################################################################################################
#Avant de procéder à la construction des variables synthétiques et à la modélisation, une analyse descriptive des données a été réalisée pour explorer les caractéristiques des ménages urbains et identifier les relations potentielles entre les variables. Cette analyse s’appuie sur la base `data_urban`, qui contient les données brutes avant tout regroupement ou création de variables composites.

#________________________Variables quantitatives
# Variables sélectionnées
selected_vars <- c("dtot", "hhsize", "hage")

# Vérification des variables dans le dataset
missing_vars <- setdiff(selected_vars, names(data_urban))
if (length(missing_vars) > 0) {
  stop("Variables manquantes : ", paste(missing_vars, collapse = ", "))
}

# Sélection et conversion
data_check <- data_urban %>%
  select(all_of(selected_vars)) %>%
  mutate(across(everything(), ~ as.numeric(as.character(.))))

# Supprimer les colonnes avec que des NA
valid_vars <- names(data_check)[colSums(!is.na(data_check)) > 0]
data_check <- data_check %>% select(all_of(valid_vars))

if (ncol(data_check) == 0) {
  stop("Toutes les colonnes sont invalides (que des NA).")
}

# Fonction de résumé pour une variable
resumer_variable <- function(v) {
  c(Moyenne = mean(v, na.rm = TRUE),
    Mediane = median(v, na.rm = TRUE),
    Ecart_type = sd(v, na.rm = TRUE),
    Minimum = min(v, na.rm = TRUE),
    Maximum = max(v, na.rm = TRUE),
    Asymetrie = skewness(v, na.rm = TRUE))
}

# Appliquer à chaque variable
summary_quanti <- data.frame(t(sapply(data_check, resumer_variable)))
summary_quanti <- tibble::rownames_to_column(summary_quanti, var = "Variable")

# Affichage du tableau
kable(summary_quanti, digits = 2, caption = "Résumé statistique des variables quantitatives") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"),
                full_width = FALSE, font_size = 10)


#__________________________Variables qualitatives

# Labels pour typ_logement
label_typ_logement <- c(
  "1" = "Maison moderne (Villa)",
  "2" = "Immeuble/appartement",
  "3" = "Maison individuelle simple en dur",
  "4" = "Célibatérium",
  "5" = "Maison individuelle simple en banco",
  "6" = "Maison traditionnelle en banco",
  "7" = "Case/paille",
  "8" = "Autre"
)

# Sélection des variables qualitatives
qual_vars <- c("typ_logement")

# Vérification des variables présentes
missing_vars <- setdiff(qual_vars, names(data_urban))
if (length(missing_vars) > 0) {
  stop("Variables manquantes dans data_urban : ", paste(missing_vars, collapse = ", "))
}

# Créer une copie du data_urban avec typ_logement labelisé
data_labeled <- data_urban %>%
  mutate(
    typ_logement_label = factor(
      label_typ_logement[as.character(typ_logement)],
      levels = label_typ_logement # pour garder l'ordre des labels
    )
  )

# Créer les tableaux de fréquences sur la variable labelisée
summary_quali <- data_labeled %>%
  select(typ_logement_label) %>%
  summarise(across(everything(), ~list(table(.)))) %>%
  pivot_longer(cols = everything(), names_to = "Variable", values_to = "Frequences") %>%
  mutate(
    Frequences = map2(Frequences, Variable, ~kable(.x, caption = paste("Fréquences pour", .y)) %>%
                        kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = FALSE))
  )

# Diagramme en barres avec labels
ggplot(data_labeled, aes(x = typ_logement_label, fill = typ_logement_label)) +
  geom_bar() +
  labs(title = "Répartition des types de logement",
       x = "Type de logement", y = "Effectif") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  guides(fill = "none")

#____________________________Tableau croisé
# Labels des types de logement
label_typ_logement <- c(
  "1" = "Maison moderne (Villa)",
  "2" = "Immeuble/appartement",
  "3" = "Maison individuelle simple en dur",
  "4" = "Célibatérium",
  "5" = "Maison individuelle simple en banco",
  "6" = "Maison traditionnelle en banco",
  "7" = "Case/paille",
  "8" = "Autre"
)

# Labels des régions
label_region <- c(
  "1" = "Boucle du Mouhoun",
  "2" = "Cascades",
  "3" = "Centre",
  "4" = "Centre-Est",
  "5" = "Centre-Nord",
  "6" = "Centre-Ouest",
  "7" = "Centre-Sud",
  "8" = "Est",
  "9" = "Hauts Bassins",
  "10" = "Nord",
  "11" = "Plateau-Central",
  "12" = "Sahel",
  "13" = "Sud-Ouest"
)

# Ajout des labels à la base de données
data_labeled <- data_urban %>%
  mutate(
    typ_logement_label = factor(label_typ_logement[as.character(typ_logement)],
                                levels = label_typ_logement),
    region_label = factor(label_region[as.character(region)],
                          levels = label_region)
  )

# Création du tableau croisé
tableau_croise <- data_labeled %>%
  filter(!is.na(typ_logement_label), !is.na(region_label)) %>%
  count(typ_logement_label, region_label) %>%
  pivot_wider(names_from = region_label, values_from = n, values_fill = 0)


# 1. Compter le nombre total de ménages par région (en caractères)
regions_extremes <- data_labeled %>%
  filter(!is.na(region_label)) %>%
  count(region_label, name = "total_menages") %>%
  arrange(desc(total_menages))

# 2. Sélectionner les 3 régions les plus et les moins peuplées en caractères
regions_choisies <- c(
  as.character(head(regions_extremes$region_label, 3)),  # top 3
  as.character(tail(regions_extremes$region_label, 3))   # bottom 3
)

# 3. Filtrer les données avec ces 6 régions (region_label en facteur ok)
data_plot_filtré <- data_labeled %>%
  filter(as.character(region_label) %in% regions_choisies, !is.na(typ_logement_label)) %>%
  count(typ_logement_label, region_label)

# 4. Créer le tableau croisé
tableau_extremes <- data_plot_filtré %>%
  pivot_wider(names_from = region_label, values_from = n, values_fill = 0)

# 5. Vérifier les colonnes présentes
cols_disponibles <- colnames(tableau_extremes)

# 6. Garder uniquement les régions existantes comme colonnes
regions_valides <- regions_choisies[regions_choisies %in% cols_disponibles]

# 7. Réordonner le tableau (typ_logement_label + régions valides)
tableau_extremes <- tableau_extremes[, c("typ_logement_label", regions_valides)]

# 8. Afficher le tableau
kable(tableau_extremes,
      caption = "Tableau croisé : Types de logement dans les 3 régions les plus et les moins peuplées en termes de ménages recensés",
      align = "l",
      digits = 0,
      booktabs = TRUE) %>%
  kable_styling(latex_options = "scale_down", font_size = 11)


############################# Traitement du jeu de données Pour la regression ##################################################################################################################

########### Regroupement de la variable dépendante typ_logement

# On a remarqué que certaines modalités de la variable à expliquer typ_logement
# avaient très peu d'observations et d'autres en avaient trop. Nous avons ainsi 
# décider de les regrouper par ressemblance ou affinité. Alors, les modalités 1 et 2 en "Logement moderne" , les modalités
# 5,6,7 et 8 en "logement traditionnel". Les autres modalités(3 et 4) ne sont pas groupées.

# Recodage des valeurs d’origine de la variable typ_logement en 4 nouvelles catégories

data_urban$typ_logement <- as.character(data_urban$typ_logement)
data_urban$typ_logement[data_urban$typ_logement == "2"] <- "1"
data_urban$typ_logement[data_urban$typ_logement == "3"] <- "2"
data_urban$typ_logement[data_urban$typ_logement == "4"] <- "3"
data_urban$typ_logement[data_urban$typ_logement == "5"] <- "4"
data_urban$typ_logement[data_urban$typ_logement == "6"] <- "4"
data_urban$typ_logement[data_urban$typ_logement == "7"] <- "4"
data_urban$typ_logement[data_urban$typ_logement == "8"] <- "4"

# Création du tableau de regroupement
regroupement <- data.frame(
  `Code regroupé` = c(1, 2, 3, 4),
  `Modalités initiales` = c("1, 2", "3", "4", "5, 6, 7, 8"),
  `Libellé` = c("Logement moderne", "Maison individuelle en dur", "Célibatérium", "Logement traditionnel")
)

# Affichage sous format plus structurée les résultats
kable(regroupement, caption = "Tableau 1 : Regroupement des modalités de la variable `typ_logement`")

# Transformation de la variable typ_logement en facteur
data_urban$typ_logement <- as.factor(data_urban$typ_logement)

# Ajout des labels 
levels(data_urban$typ_logement) <- c(
  "Logement moderne",
  "Maison individuelle en dure",
  "Célibatérium",
  "Logement traditionnel"
)



########### Regroupement de la variable hage en intervalles 

# La variable hage est constituée des âges des ménages. Il nous a semblé plus pertinent de regrouper ces âges en
# intervalles pour faciliter l'interprétation et les estimations. En effet, il est plus avantageux pour une entreprise donnée, de connâitre 
# les chances pour une catégorie donnée(par exemple jeune, vieux, etc), de choisir tel type de logement.Celà rend va permettre ainsi de pouvoir comparer entre catégorie
# Ainsi, ceux qui ont un âge inférieur à 30 sont des jeunes, ceux qui en ont compris entre 31 et 50 sont des adultes, et le reste est considéré comme vieux. 

data_urban$age_cat <- cut(data_urban$hage, breaks = c(0, 30, 50, Inf), labels = c("jeune", "adulte", "âgé"))




########### Regroupement des différentes possessions des ménages 

# Dans le jeu de données, certains ménages ont des possessions. Nous pouvons donc les regrouper selon leurs  caractéristiques similaires
# Par exemple, les objets ensemble. Par la suite, nous décidons de regrouper ces informations dispersées en une seule variable


#### 1. Score de possession de biens

# Ici, nous regroupons les objets possédés par le ménage en une variable que nous allons utiliser par la suite pour produire
# uen Analyse en Correspondantes Princiaples. Cette ACP permettra donc de synthétiser les informations contenues dans chaque possession
# et permettre ainsi de voir les ressemblances. Un indicateur sera à la suite crée grâce à la première composante principale qui résume la plus grande partie de la 
# variance commune entre les biens.


# Variables binaires (0/1) de biens durables
equip_vars <- data_urban[, c("tv", "frigo", "cuisin", "car", "fer", "ordin", "decod")]
# Conversion en numérique
equip_vars[] <- lapply(equip_vars, function(x) as.numeric(as.character(x)))
# ACP pour extraire un score synthétique de possession
res_pca <- PCA(equip_vars, scale.unit = TRUE, ncp = 2, graph = FALSE)
# Extraction de la 1ère composante comme score
data_urban$possession_bien <- res_pca$ind$coord[, 1]


#### 2. Préparation des autres variables (élec + eau)

# Dans cette partie, nous préparons les variables elec et eau pour être intégrés dans l'analyse statistique suivante.
# Nous vérifions si ces variables sont numériques afin de pouvoir les intégrer.

class(data_urban$elec_ac) 
class(data_urban$eauboi_ss)


#### 3. Création du score global de confort (ACP sur 3 dimensions)

# Ici, nous réalisons une nouvelle ACP mais cette fois ci avec avec trois dimensions, en combinant le score de possession de biens,
# l'acces reseau electrique et à l'eau potable en saison sèche. Pour faire cette analyse, nous supprimons les observations manquantes afin de ne pas biaiser les résultats.


# Sélection des variables à fusionner
vars_confort <- data_urban[, c("possession_bien", "elec_ac", "eauboi_ss")]

# Supprimer les lignes avec NA
idx_valid <- complete.cases(vars_confort)
vars_confort_valid <- vars_confort[idx_valid, ]

# Réalisation de l'ACP 
pca_confort <- prcomp(vars_confort_valid, scale. = TRUE)

# Extraction de la 1ère composante comme score global
# Nous retenons ici la première composante principale comme score global de confort. Ce score va constituer une mesure synthétique du niveau de confort du ménage
# tout en tenant en compte de plusieurs des caractéristiques prises en compte.
score_global <- pca_confort$x[, 1]

# Ajout dans la base initiale
data_urban$score_confort <- NA
data_urban$score_confort[idx_valid] <- score_global


### 4. Catégorisation du score global : faible / moyen / élevé
# Etant donné que le score global est constitué de valeurs continues, nous décidons de les regrouper selon leur proportion, afin de pouvoir créer un niveau de confort
data_urban$niveau_confort <- cut(
  data_urban$score_confort,
  breaks = quantile(data_urban$score_confort, probs = c(0, 0.33, 0.66, 1), na.rm = TRUE),
  labels = c("faible", "moyen", "élevé"),
  include.lowest = TRUE
)



########### Score de qualité du logement

# À ce niveau, un score simple de qualité du logement a été construit à partir de trois variables binaires : type de mur, de toit et de sol. Le score qualite_logement est 
# obtenu par somme directe (valeurs entre 0 et 3)
data_urban$qualite_logement <- rowSums(data_urban[, c("mur", "toit", "sol")])


########### Indice socioéconomique par ACM

# Ici, un indice synthétique de position sociale a été calculé par analyse des correspondances multiples (ACM) à partir du niveau d’éducation (heduc) et du statut dans 
# la population active (hcsp). L'ACM va donc résumer les positions sociales selon les combinaisonsndes modalités de ces deux variables     

df_cat <- data_urban[, c("heduc", "hcsp")]
res_mca <- MCA(df_cat, graph = FALSE)

# On extrait ensuite l'axe 1 de l'ACM qui contient le plus d'informations commune entre heduc et hcsp. Cette valeur devient le score socio économique de chaque ménage.
data_urban$indice_socioeco <- res_mca$ind$coord[,1] 





############################# Sélection d'un certain nombre de variables utiles pour l'analyse économétrique  ###############################################################

# Dans cette partie, nous renomons les noms des variables en des noms plus explicites

data_urban <- data_urban %>%
  dplyr::rename(
    type_logement = typ_logement,                  # Variable dépendante (regroupée)
    statut_occupation = logem,                     # Statut d’occupation du logement
    age_chef = age_cat,                            # Âge du chef de ménage (catégorisé)
    taille_menage = hhsize,                        # Nombre de membres dans le ménage
    statut_matrimonial = hmstat,                   # Statut matrimonial
    niveau_education = heduc,                      # Niveau d’éducation
    cat_socio_prof = hcsp,                         # Catégorie socio-professionnelle
    depenses_menage = dtot,                        # Dépenses totales du ménage
    actif_derniere_sem = hactiv7j,                 # Chef actif durant les 7 derniers jours
    qualite_logement = qualite_logement,           # Score basé sur matériaux
    niveau_confort = niveau_confort,              # Score basé sur les biens possédés
    electricite = elec_ac,                         # Accès à l’électricité
    region_residence = region,                     # Région urbaine
    score_socioeco = indice_socioeco               # Score ACM (éducation + activité)
  )

# Quelques variables explicatives sont sélectionnées pour voir leur pertinence et garder après uniquement les 8 variables les plus explicatives
data_subset <- data_urban %>%
  dplyr::select(type_logement, statut_occupation, age_chef, taille_menage,
                statut_matrimonial, niveau_education, cat_socio_prof,
                depenses_menage, actif_derniere_sem, qualite_logement,
                niveau_confort, electricite, region_residence, score_socioeco)


# Afin d'utiliser la variable typ_logement comme variable dépendante dans notre régression, nous la convertissons en factor. Egalement, les variables groupées qualitatives 
# sont également transformées en fator
data_subset$type_logement <- as.factor(data_subset$type_logement)
factor_vars2 <- c("age_chef",  "niveau_confort","cat_socio_prof", "qualite_logement", "region_residence", "statut_matrimonial", "statut_occupation")
data_subset[factor_vars2] <- lapply(data_subset[factor_vars2], as.factor)




############################# Analyse et traitement des données manquantes et abérrantes ################################################################################### 


## Traitement des valeurs manquantes

# On a constaté que la variable cat_socio_prof contient des valeurs manquantes qu'il faut traiter avant l'analyse. Pour gérer les données manquantes, nous alons utiliser
# l’imputation multiple avec le package mice. La variable catégorielle cat_socio_prof a sera imputée par régression polytomique (polyreg).
# Par la suite, la matrice des prédicteurs sera ajustée pour éviter la colinéarité et exclure la variable cible afin d’éviter la fuite d’information. 
# Nous adoption cette méthode car elle permet d’obtenir des estimations plus fiables que la suppression simple des données manquantes. La base finale est issue de 
# la combinaison des 5 jeux de données imputés



# Initialisation de l’imputation multiple
init <- mice(data_subset, maxit = 0)

# Méthodes d’imputation
meth <- init$method

# Imputation de cat_socio_prof par régression polytomique (logit multinomial)
meth["cat_socio_prof"] <- "polyreg"

# Matrice des prédicteurs
pred <- make.predictorMatrix(data_subset)

# Ajustement des prédicteurs : ici, on choisit "score_socioeco" comme seul prédicteur
# Supposons qu'il s'agit bien d'une variable disponible dans data_subset
pred["cat_socio_prof", ] <- 0
pred["cat_socio_prof", "score_socioeco"] <- 1


# Ici, on empêche "type_logement" d’être utilisé pour imputer cat_socio_prof
pred["cat_socio_prof", "type_logement"] <- 0 

# Lancement de l’imputation multiple
set.seed(500)
imp <- mice(data_subset, m = 5, maxit = 10, method = meth, predictorMatrix = pred, printFlag = TRUE)

# Extraction du jeu de données complet imputé
DataBase <- complete(imp)




## Traitement des valeurs aberrantes 
# Nous utilisons ici des boîtes à moustaches pour visualiser la distribution des variables quantitatives clés, notamment les dépenses totales
# du ménage et la taille du ménage. Ces représentations nous permettrons de repérer visuellement les observations éloignées des quartiles 
# par exemple les valeurs au-delà de 1,5 fois l'écart interquartile.


boxplot(DataBase$depenses_menage, main = "Dépenses du ménage")
boxplot(DataBase$taille_menage, main = "Taille du ménage")


# En observant les deux boîtes à moustache, on constate une forte disparité entre les dépenses et les tailles des ménages. On remarque en 
# effet la présence de valeurs atypiques. Ainsi nous allons utiliser le critère IQR (Interquartile Range) qui permet de détecter les valeurs
# abérrantes. Pour celà, nous allons calculer les 1er et 3e quatiles et déterminer l'écart interquartile. Ainsi, les valeurs en dehors de l'intervalle
# interquartile sont considérées comme abérrantes et seront ainsi retirées du jeu de données.

traitement_outliers <- function(df, df_var){
  
  # Calcul des quartiles
  Q1 <- quantile(df_var, 0.25, na.rm = TRUE)
  Q3 <- quantile(df_var, 0.75, na.rm = TRUE)
  
  # IQR
  IQR_val <- Q3 - Q1
  
  # Bornes
  borne_basse <- Q1 - 1.5 * IQR_val
  borne_haute <- Q3 + 1.5 * IQR_val
  
  # Filtrage : suppression des outliers
  df_clean <- df[df_var >= borne_basse & df_var <= borne_haute, ]
  return (df_clean)
}

DataBase= traitement_outliers(DataBase, DataBase$taille_menage)
DataBase= traitement_outliers(DataBase, DataBase$depenses_menage)



########################### Test de correlation entre les variables quantitatives ########################################################################################

# Après la gestion des valeurs manquantes et abérrantes, nous allons maintenant nous interesser à la corrélation entre les variables quantitatives. En cas de forte 
# corrélation détectée, nous allons procéder à la suppression d'une des variables pour conserver la robustesse du modèle. Tout d'abord nous allons réaliser le test de 
# Shapiro-Wilk pour voir la distribution des données des variables quantitatives afin de nous orienter sur le test de corrélation approprié. 



vars_quanti <- as.data.frame(DataBase[, c("depenses_menage", "taille_menage")])
# 1. Test de normalité (Shapiro-Wilk) pour chaque variable
# Pour chaque variable quantitative depenses_menage et taille_menage, on effectue le test de Shapiro-Wilk afin de vérifier si les données suivent une distribution
# normale
shapiro_results <- sapply(vars_quanti, function(x) shapiro.test(x)$p.value)
shapiro_df <- data.frame(
  Variable = names(shapiro_results),
  p.value = round(shapiro_results, 4)
)
shapiro_results
# 3. Choix automatique du test de corrélation
# Le choix automatique fait que test de Pearson est proposé si les 2 variables suivent une loi normale. Dans le cas contraire, le test de Spearman
# est proposé

if(all(shapiro_results > 0.05)) {
  methode <- "pearson"
  cat("\nConditions normales remplies : test de Pearson recommandé\n")
} else {
  methode <- "spearman"
  cat("\nDonnées non normales : test de Spearman recommandé\n")
}


# 4. Test de corrélation
# Nous éffectuons à présent le test de corrélation de Spearman
cor_test <- cor.test(
  vars_quanti$taille_menage, 
  vars_quanti$depenses_menage,
  method = methode,
  exact = ifelse(methode == "spearman", FALSE, NA)
)

# 5. Résultats du test de corrélation
results_df <- data.frame(
  Coefficient = round(cor_test$estimate, 3),
  p.value = ifelse(cor_test$p.value < 0.001, "< 0.001", round(cor_test$p.value, 4))
)
if(methode == "pearson") {
  results_df$IC_95 <- paste0("[", round(cor_test$conf.int[1], 3), ", ", round(cor_test$conf.int[2], 3), "]")
}
print(results_df)


# 6. Fonction d’interprétation automatique
interpret_cor <- function(r, p) {
  if(p >= 0.05) return("Aucune corrélation significative")
  strength <- ifelse(abs(r) > 0.7, "Forte",
                     ifelse(abs(r) > 0.3, "modérée", "faible"))
  direction <- ifelse(r > 0, "positive", "négative")
  paste( "Corrélation", direction,strength, "(r =", round(r, 3), ")")
}
cat(" n INTERPRÉTATION: n")
cat(interpret_cor(cor_test$estimate, cor_test$p.value), " n")





########################### Test de correlation entre les variables qualitatives ###########################################################################################

# Afin d’évaluer l’association entre variables qualitatives, le V de Cramér a été utilisé.Cet indicateur, dérivé du test du chi², permettra de mesurer la force de 
# l’association entre deux variables catégorielles, indépendamment de leurs dimensions. Nous allons visuliser ces resultats afin de choisir les variables à la fois 
# pertinentes et moins corrélées. 



# Fonction pour calculer le V de Cramér
cramer_v <- function(var1, var2) {
  tbl <- table(var1, var2)
  chi2 <- chisq.test(tbl)$statistic
  n <- sum(tbl)
  min_dim <- min(nrow(tbl) - 1, ncol(tbl) - 1)
  sqrt(chi2 / (n * min_dim))
}

# Calculer V de Cramér pour toutes les paires de variables catégoriques
cat_vars <- factor_vars2 <- c("age_chef",  "niveau_confort","cat_socio_prof", "qualite_logement", "region_residence", "statut_matrimonial", "statut_occupation")
cramer_matrix <- matrix(NA, nrow = length(cat_vars), ncol = length(cat_vars), 
                        dimnames = list(cat_vars, cat_vars))

for (i in 1:length(cat_vars)) {
  for (j in 1:length(cat_vars)) {
    if (i != j) {
      cramer_matrix[i, j] <- cramer_v(data_subset[[cat_vars[i]]], data_subset[[cat_vars[j]]])
    }
  }
}

# Visualisation
corrplot(cramer_matrix, method = "color", type = "upper", order = "hclust", 
         addCoef.col = "black", tl.col = "black", tl.srt = 45, 
         diag = FALSE)

title(main = "V de Cramér", cex.main = 1.5, font.main = 2)



########################### Regression logistique ##########################################################################################################################
# A la suite des différents traitements et tests éffectués, quelques variables ont été sélectionnées pour la regression logistique. La variable dépendante type_logement 
# est catégorielle à   plus de deux modalités, justifiant l’usage de ce modèle. Les variables explicatives incluent des caractéristiques démographiques  
# (taille_menage, age_chef), économiques (score_socioeco, depenses_menage), résidentielles (region_residence, statut_occupation), ainsi qu’un indicateur de confort 
# (niveau_confort) et de qualité de l’habitat  (qualite_logement). Par ailleurs, la variable continue depenses_menage a été log-transformée afin de réduire l’asymétrie 
# de sa distribution et améliorer l'ajustement  du modèle


Base_finale = DataBase

Base_finale$depenses_menage= log(Base_finale$depenses_menage + 1)

# Regression
model_3 <- multinom(type_logement ~ taille_menage + age_chef + score_socioeco + niveau_confort + qualite_logement + region_residence + depenses_menage + statut_occupation,
                    data = Base_finale)
summary(model_3)


########### Diagnostic et validation du modèle 

# Afin de garantir la robustesse et la fiabilité du modèle multinomial estimé, il est essentiel de procéder à une série de validations statistiques. Ces étapes 
# permettent de s’assurer que le modèle est correctement spécifié, qu’il fournit des prédictions cohérentes et qu’il respecte les hypothèses de base. Nous allons
# éffectuer 



### Test du rapport de vraisemblance (Likelihood Ratio Test - LRT)

# Nous allons éffectuer un test LRT qui va comparer le modèle null à notre modèle (complet). 
# L’objectif est de déterminer si ces variables en plus apportent une contribution significative à l’explication de la variable dépendante.
# Le test repose sur la comparaison des log-vraisemblances maximales obtenues pour chacun des deux modèles
# Log-vraisemblance des modèles


model_null <- multinom(type_logement ~ 1, data = Base_finale)
ll_full <- logLik(model_3)
ll_null <- logLik(model_null)

# Déviances
dev_full <- -2 * as.numeric(ll_full)
dev_null <- -2 * as.numeric(ll_null)

# Statistique du test LRT
LRT_stat <- dev_null - dev_full

# Degrés de liberté
df_diff <- attr(ll_full, "df") - attr(ll_null, "df")

# p-value
p_value <- pchisq(LRT_stat, df = df_diff, lower.tail = FALSE)

# Affichage
cat("Test global du modèle multinomial model_3:\n")
cat("Statistique du test (LRT) =", round(LRT_stat, 3), "\n")
cat("Degrés de liberté =", df_diff, "\n")
cat("p-value =", signif(p_value, 4), "\n")



### Pseudo R² de McFadden

# Il viendra mesurer la proportion de la variance expliquée, les modèles logistiques ne permettant pas un tel calcul direct, 
# le pseudo R² de McFadden remplit donc ce rôle en évaluant dans quelle mesure le modèle améliore l’ajustement par rapport à un modèle 
# nul. Nous allons donc l'utiliser pour vérifier la qualité de l'ajustement.
pR2(model_3)



### Validation croisée (Cross-validation) 
# Etant donné que La validation croisée aide à éviter le sur-apprentissage en testant le modèle sur différentes parties de l’échantillon, 
# et en s’assurant qu’il est robuste et stable.Nous allons diviser l’échantillon en plusieurs sous-échantillons (folds), puis d’utiliser 
# certains folds pour entraîner le modèle, et les autres pour le tester.Cela permettra d’évaluer la qualité prédictive du modèle
# et donc de valider sa structure

set.seed(123)  # Pour reproductibilité

# Nombre de folds
k <- 5

# Création des folds (stratifiés sur la variable cible)
folds <- createFolds(Base_finale$type_logement, k = k, list = TRUE, returnTrain = FALSE)

# Initialisation du vecteur des accuracies
accuracies <- numeric(k)

# Boucle sur les folds
for (i in seq_along(folds)) {
  test_idx <- folds[[i]]
  
  train_data <- Base_finale[-test_idx, ]
  test_data <- Base_finale[test_idx, ]
  
  # Entraînement du modèle multinomial sur les données d'entraînement
  model_cv <- multinom(
    type_logement ~ taille_menage + age_chef + score_socioeco +
      niveau_confort + qualite_logement + region_residence +
      depenses_menage + statut_occupation,
    data = train_data,
    trace = FALSE
  )
  
  # Prédiction sur les données de test
  preds <- predict(model_cv, newdata = test_data)
  
  # Calcul de l'accuracy (taux de bonnes prédictions)
  acc <- mean(preds == test_data$type_logement)
  accuracies[i] <- acc
  
  # Affichage du score pour chaque fold
  cat("Fold", i, "- Accuracy:", round(acc, 4), "\n")
}

# Affichage de l'accuracy moyenne
cat("Accuracy moyenne sur", k, "folds :", round(mean(accuracies), 4), "\n")


### Test de significativité de Wald
# Nous allons à présent vérifier par le test de Wald si un coefficient estimé (β) est significativement différent de zéro

# Résumé du modèle
summary_model <- summary(model_3)

# Coefficients estimés
coefs <- summary_model$coefficients

# Erreurs standard
ses <- summary_model$standard.errors

# Statistiques z
z_values <- coefs / ses

# p-values bilatérales (test de Wald)
p_values <- 2 * (1 - pnorm(abs(z_values)))

# Organisation du résultat dans un data.frame
result <- data.frame(
  Variable = rep(rownames(coefs), times = ncol(coefs)),
  Modalite = rep(colnames(coefs), each = nrow(coefs)),
  Estimate = as.vector(coefs),
  Std_Error = as.vector(ses),
  z_value = as.vector(z_values),
  p_value = as.vector(p_values)
) %>%
  arrange(Modalite, Variable)

# Affichage avec knitr::kable
knitr::kable(head(result, 15), digits = 4, caption = "Tests de significativité des coefficients du modèle multinomial (test de Wald) - 10 premières lignes")



### Multicolinéarité

# Dans le cadre d'un modèle multinomial, la présence de multicolinéarité peut biaiser l'interprétation des effets individuels des variables explicatives
# et affecter la stabilité des coefficients estimés. Pour détecter et évaluer la multicolinéarité, des indicateurs tels que le facteur d'inflation de la
# variance (VIF) sont fréquemment utilisés. Une valeur de VIF élevée (généralement supérieure à 5 ou 10) signale une possible multicolinéarité problématique entre les variables. 
# Nous allons donc procéder à l'analyse de la multicolinéarité afin de garantir la robustesse et la fiabilité de notre modèle.


mod_lm <- lm(taille_menage ~ age_chef + score_socioeco + niveau_confort + qualite_logement + region_residence + depenses_menage + statut_occupation,
             data = Base_finale)

# Calcul des VIF
vif_values <- vif(mod_lm)
print(vif_values)


# Comme certaines variables sont catégorielles avec plusieurs modalités, nous avons aussi utilisé le GVIF corrigé qui tient compte du nombre de degrés de
# liberté, ce qui facilite la comparaison entre variables. Cette étape permettra de repérer d’éventuelles variables trop corrélées qu’il faudrait peut-être 
# retirer ou transformer pour améliorer la robustesse de notre modèle.

gvif_table <- data.frame(
  Variable = c("age_chef", "score_socioeco", "niveau_confort", "qualite_logement", 
               "region_residence", "depenses_menage", "statut_occupation"),
  GVIF = c(1.249116, 1.621653, 2.117231, 1.471597, 1.595132, 1.844798, 1.994229),
  Df = c(2, 1, 2, 3, 12, 1, 3),
  GVIF_corrige = c(1.057184, 1.273441, 1.206263, 1.066510, 1.019647, 1.358234, 1.121922)
)

kable(gvif_table, digits = 4, caption = "GVIF et GVIF corrigé pour les variables explicatives")




### Analyse des résidus
# En étudiant la distribution des résidus, on peut détecter des anomalies ou des faiblesses dans le modèle, comme une mauvaise spécification
# du modèle, ou encore des problèmes de non-linéarité ou d’hétéroscédasticité.Les résidus permettront ainsi de vérifier si les probabilités prédites 
# par le modèle s’éloignent trop des observations réelles et d’identifier les points influents ou mal prédits.
#  Celà nous aidera à voir comment respécifier le modèle

# Nous allons extraire les résidus de deux types différents: les résidus de déviance et les résidus de Pearson à partir du modèle de régression
# multinomiale. Un histogramme sera ensuite tracé pour chaque type de résidu et pour chaque catégorie, permettant ainsi d’observer la distribution 
# des résidus de manière détaillée. 

# Résidus
resid_dev <- residuals(model_3, type = "deviance")
resid_pearson <- residuals(model_3, type = "pearson")

resid_df <- data.frame(resid_dev)
colnames(resid_df) <- paste0("Dev_", colnames(resid_df))
resid_df <- cbind(resid_df, resid_pearson)
colnames(resid_df)[(ncol(resid_df)-ncol(resid_pearson)+1):ncol(resid_df)] <- paste0("Pearson_", colnames(resid_pearson))

# Passage en format long (long format)
resid_long <- resid_df %>%
  mutate(id = 1:n()) %>%
  pivot_longer(cols = -id, names_to = c("Type", "Categorie"), names_sep = "_", values_to = "Residus")

# Histogramme des résidus
ggplot(resid_long, aes(x = Residus, fill = Type)) +
  geom_histogram(bins = 30, alpha = 0.6, position = "identity") +
  facet_wrap(~Categorie + Type, scales = "free") +
  labs(title = "Distribution des résidus de déviance et de Pearson par catégorie",
       x = "Valeur du résidu", y = "Effectif") +
  theme_minimal()


##############################  FIN    ######################################
#############################################################################
#############################################################################










