# 📊 Projet STATA - Analyse Économétrique et Données PMA

## 🎯 Objectif du Projet

Développement d'analyses économétriques avancées utilisant STATA pour traiter et analyser les données PMA (Performance Monitoring for Action). Le projet vise à maîtriser les techniques d'analyse de données complexes et la programmation STATA pour la recherche en santé reproductive et démographie.

## 📈 Données Analysées

### Données PMA (Performance Monitoring for Action)
- **PMA2021_BFP2_HQFQ_v1.0_1Oct2021.dta** : Enquête principale 2021
- **Données d'exercice** : PMA data for exercise
- **Variables démographiques** : Âge, sexe, niveau d'éducation
- **Variables de santé** : Santé reproductive, planification familiale
- **Variables socio-économiques** : Revenus, occupation, lieu de résidence

### Types d'Analyses
- **Statistiques descriptives** : Caractéristiques de l'échantillon
- **Analyses bivariées** : Relations entre variables
- **Modélisation multivariée** : Régression logistique, linéaire
- **Analyses géographiques** : Variations spatiales

## 🛠️ Technologies Utilisées

### STATA
- **STATA 17/18** : Logiciel d'analyse statistique
- **Do-files** : Scripts de programmation
- **Commandes avancées** : Fonctions spécialisées
- **Graphiques** : Visualisations intégrées

### Fonctionnalités Utilisées
- **Manipulation de données** : Merge, append, reshape
- **Statistiques** : Summarize, tabulate, correlate
- **Modélisation** : Regress, logistic, xtreg
- **Graphiques** : Histogram, scatter, boxplot

### Outils de Programmation
- **Do-files** : Scripts reproductibles
- **Macros** : Variables locales et globales
- **Boucles** : Automatisation des analyses
- **Fonctions** : Commandes personnalisées

## 📁 Structure du Projet

```
STATA/
├── PMA2021_BFP2_HQFQ_v1.0_1Oct2021.dta    # Données principales
├── Sans titre2.sav                         # Données SPSS converties
├── STATA Zemba.pptx                        # Présentation
├── datasets for exercise/                  # Données d'exercice
│   ├── PMA data for exercise_appending_2county.dta
│   ├── PMA data for exercise_EAweight.dta
│   ├── PMA data for exercise.csv
│   ├── PMA data for exercise.dta
│   ├── PMA data for exercise.do
│   └── PMA data for exercise.xlsx
└── stataWorkSpace/                         # Espace de travail STATA
```

## 📊 Fonctionnalités d'Analyse

### 1. Préparation des Données
- **Import/Export** : Formats multiples (DTA, CSV, XLSX)
- **Nettoyage** : Gestion des valeurs manquantes
- **Recodage** : Transformation des variables
- **Pondération** : Application des poids d'échantillonnage

### 2. Statistiques Descriptives
- **Résumés numériques** : Moyennes, médianes, écarts-types
- **Tableaux de fréquence** : Distributions catégorielles
- **Graphiques** : Histogrammes, boxplots, scatterplots
- **Tests de normalité** : Validation des distributions

### 3. Analyses Bivariées
- **Tests de comparaison** : t-test, chi², ANOVA
- **Corrélations** : Pearson, Spearman
- **Graphiques** : Relations entre variables
- **Tests non-paramétriques** : Wilcoxon, Kruskal-Wallis

### 4. Modélisation Économétrique
- **Régression linéaire** : Modèles prédictifs
- **Régression logistique** : Variables binaires
- **Modèles multiniveaux** : Données hiérarchiques
- **Modèles de panel** : Données longitudinales

## 🎨 Types de Visualisations

### Graphiques de Base
- **Histogrammes** : Distribution des variables
- **Boxplots** : Résumés et outliers
- **Scatterplots** : Relations entre variables
- **Barplots** : Comparaisons de catégories

### Graphiques Avancés
- **Graphiques combinés** : Multiples variables
- **Graphiques par groupes** : Stratification
- **Graphiques de régression** : Droites d'ajustement
- **Graphiques de diagnostic** : Résidus et influence

### Graphiques Spécialisés
- **Graphiques de survie** : Courbes de Kaplan-Meier
- **Graphiques ROC** : Performance des modèles
- **Graphiques de corrélation** : Matrices
- **Graphiques géographiques** : Cartes et spatialisation

## 🔧 Fonctionnalités Techniques

### Manipulation de Données
- **Merge** : Fusion de bases de données
- **Append** : Concaténation verticale
- **Reshape** : Restructuration (long/wide)
- **Collapse** : Agrégation par groupes

### Programmation STATA
- **Do-files** : Scripts reproductibles
- **Macros** : Variables locales et globales
- **Boucles** : Automatisation (foreach, forvalues)
- **Conditions** : Structures if/else

### Analyses Spécialisées
- **Pondération** : Poids d'échantillonnage
- **Clustering** : Groupes et strates
- **Bootstrap** : Intervalles de confiance
- **Jackknife** : Estimation de variance

## 📊 Exemples d'Analyses

### Analyse Démographique
- **Pyramide des âges** : Structure démographique
- **Fécondité** : Indices et taux
- **Mortalité** : Tables de mortalité
- **Migration** : Flux et stocks

### Analyse de Santé
- **Santé reproductive** : Indicateurs clés
- **Planification familiale** : Utilisation et besoins
- **Santé maternelle** : Soins prénatals et accouchement
- **Santé infantile** : Vaccination et nutrition

### Analyse Socio-économique
- **Niveau d'éducation** : Scolarisation et alphabétisation
- **Revenus** : Distribution et inégalités
- **Occupation** : Secteurs d'activité
- **Pauvreté** : Indicateurs multidimensionnels

## 🎯 Compétences Développées

### STATA
- **Interface** : Navigation et commandes
- **Programmation** : Do-files et macros
- **Graphiques** : Création et personnalisation
- **Modélisation** : Régression et diagnostics

### Statistiques
- **Statistiques descriptives** : Résumés et distributions
- **Tests d'hypothèses** : Inférence statistique
- **Modélisation** : Régression et ANOVA
- **Diagnostics** : Validation des modèles

### Épidémiologie
- **Enquêtes** : Méthodologie d'échantillonnage
- **Indicateurs** : Santé reproductive et démographie
- **Pondération** : Poids d'échantillonnage
- **Analyse spatiale** : Variations géographiques

### Recherche
- **Méthodologie** : Design d'études
- **Documentation** : Rapports et publications
- **Reproductibilité** : Code et procédures
- **Communication** : Présentation des résultats

## 📈 Applications Pratiques

### Santé Publique
- **Surveillance** : Indicateurs de santé
- **Évaluation** : Impact des interventions
- **Planification** : Allocation des ressources
- **Monitoring** : Suivi des objectifs

### Recherche Académique
- **Publications** : Articles scientifiques
- **Thèses** : Recherche doctorale
- **Présentations** : Conférences et séminaires
- **Collaborations** : Projets internationaux

### Secteur Privé
- **Consulting** : Études de marché
- **ONG** : Évaluation de projets
- **Institutions** : Rapports et analyses
- **Formation** : Cours et ateliers

## 🚀 Améliorations Possibles

### Fonctionnalités
- **R** : Intégration avec R
- **Python** : Scripts Python
- **Web** : Applications web
- **Cloud** : Calcul distribué

### Technique
- **Big Data** : Grands volumes
- **Machine Learning** : Modèles prédictifs
- **API** : Données en temps réel
- **Visualisation** : Graphiques interactifs

## 📚 Documentation

### Code
- **Do-files** : Scripts commentés
- **Documentation** : Guide d'utilisation
- **Exemples** : Cas d'usage
- **Tests** : Validation des résultats

### Guides
- **Tutoriels** : Apprentissage STATA
- **Best practices** : Bonnes pratiques
- **Ressources** : Documentation externe
- **Support** : Aide et assistance

## 🎓 Formation

Ce projet a été réalisé dans le cadre d'une formation en :
- **Économétrie appliquée**
- **Épidémiologie**
- **Démographie**
- **Programmation STATA**

---

*Ce projet démontre la maîtrise de STATA et des techniques d'analyse de données complexes pour la recherche en santé publique et démographie.* 