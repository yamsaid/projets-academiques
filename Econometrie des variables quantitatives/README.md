# 📊 Économétrie des Variables Quantitatives - Modélisation des Prix Immobiliers

## 🎯 Objectif du Projet

Analyse économétrique des déterminants des prix immobiliers en utilisant des méthodes de régression linéaire multiple. Le projet vise à identifier et quantifier l'impact des différentes variables explicatives sur les prix du marché immobilier.

## 📋 Contexte et Données

### Base de Données
- **Source** : SONATUR (Société Nationale des Terrains Urbains)
- **Période** : Données de ventes de terrains
- **Localisation** : Burkina Faso
- **Taille** : Base de données complète des transactions

### Variables d'Analyse
- **Variable dépendante** : Prix au m² (`Cout_m2`)
- **Variables explicatives** :
  - Superficie du terrain
  - Type d'usage (habitation, commerce, etc.)
  - Localisation (ville, site)
  - Infrastructures (électricité, eau)
  - Date de vente
  - Type d'option de paiement

## 🛠️ Technologies Utilisées

### Langage et Packages R
- **R** : Langage de programmation principal
- **tidyverse** : Manipulation et visualisation de données
- **lmtest** : Tests économétriques
- **car** : Tests de diagnostic
- **VIM** : Visualisation des valeurs manquantes
- **psych** : Statistiques descriptives
- **corrplot** : Matrices de corrélation

### Outils de Développement
- **R Markdown** : Création de rapports dynamiques
- **LaTeX** : Formatage des documents
- **Git** : Contrôle de version

## 📊 Méthodologie

### 1. Exploration des Données
- **Statistiques descriptives** : Moyennes, médianes, écarts-types
- **Analyse des valeurs manquantes** : Identification et traitement
- **Détection d'outliers** : Méthode des boîtes à moustaches
- **Matrices de corrélation** : Relations entre variables

### 2. Prétraitement des Données
- **Nettoyage** : Suppression des incohérences
- **Recodage** : Transformation des variables catégorielles
- **Transformation logarithmique** : Normalisation des distributions
- **Traitement des outliers** : Méthode IQR

### 3. Modélisation Économétrique
- **Régression linéaire multiple** : Modèle OLS
- **Tests de diagnostic** : Normalité, homoscédasticité, multicolinéarité
- **Sélection de variables** : Critères d'information
- **Validation du modèle** : Tests de robustesse

## 📈 Résultats Principaux

### Statistiques Descriptives
- **Prix moyen** : [Valeur] FCFA/m²
- **Écart-type** : [Valeur] FCFA/m²
- **Distribution** : Asymétrie positive (log-normale)

### Corrélations Significatives
- **Superficie ↔ Prix** : Corrélation positive forte
- **Infrastructures ↔ Prix** : Impact positif
- **Localisation ↔ Prix** : Effet géographique marqué

### Modèle Final
```
log(Prix_m²) = β₀ + β₁×log(Superficie) + β₂×Usage + β₃×Site + β₄×Infrastructures + ε
```

## 🔍 Tests Économétriques

### Tests de Diagnostic
- **Test de Shapiro-Wilk** : Normalité des résidus
- **Test de Breusch-Pagan** : Homoscédasticité
- **VIF** : Détection de multicolinéarité
- **Test de Ramsey** : Spécification du modèle

### Tests de Robustesse
- **Résidus studentisés** : Détection d'influential observations
- **Cook's Distance** : Points influents
- **Leverage** : Points de levier
- **DFFITS** : Impact sur les prédictions

## 📁 Structure des Fichiers

```
Econometrie des variables quantitatives/
├── script_quanti.R              # Script principal d'analyse
├── script.Rmd                   # Rapport R Markdown
├── Sonatur_csvf.csv            # Base de données
├── xgb_model_features.rds      # Modèle XGBoost
├── docs/                       # Documentation
├── TP/                         # Travaux pratiques
└── Quanti.Rproj               # Projet R
```

## 🎯 Compétences Développées

### Économétrie
- **Régression linéaire multiple** : Estimation et interprétation
- **Tests de diagnostic** : Validation des hypothèses
- **Sélection de modèles** : Critères d'information
- **Inférence statistique** : Tests d'hypothèses

### Statistiques
- **Statistiques descriptives** : Résumés numériques
- **Analyse exploratoire** : Visualisation des données
- **Tests de normalité** : Validation des distributions
- **Corrélation** : Relations entre variables

### Programmation R
- **Manipulation de données** : tidyverse, dplyr
- **Visualisation** : ggplot2, corrplot
- **Modélisation** : lm, diagnostics
- **Reporting** : R Markdown, LaTeX

### Traitement de Données
- **Nettoyage** : Correction des erreurs
- **Recodage** : Transformation des variables
- **Gestion des valeurs manquantes** : Imputation
- **Détection d'outliers** : Méthodes robustes

## 📊 Interprétation des Résultats

### Effets Principaux
1. **Superficie** : Impact positif et significatif
2. **Usage commercial** : Prime sur les prix
3. **Infrastructures** : Valeur ajoutée importante
4. **Localisation** : Effet géographique marqué

### Implications Politiques
- **Planification urbaine** : Optimisation des aménagements
- **Politique foncière** : Tarification des terrains
- **Investissement** : Priorisation des infrastructures
- **Développement** : Stratégies d'aménagement

## 🚀 Améliorations Possibles

### Méthodologiques
- **Modèles non-linéaires** : Régression polynomiale
- **Variables instrumentales** : Endogénéité
- **Modèles de panel** : Données temporelles
- **Machine Learning** : XGBoost, Random Forest

### Techniques
- **Données géospatiales** : Coordonnées GPS
- **Imagerie satellitaire** : Variables environnementales
- **Données socio-économiques** : Indicateurs locaux
- **Séries temporelles** : Évolution des prix

## 📚 Applications Pratiques

### Secteur Immobilier
- **Évaluation foncière** : Estimation des prix
- **Investissement** : Analyse de rentabilité
- **Développement** : Planification urbaine
- **Régulation** : Politiques de prix

### Recherche
- **Publications académiques** : Articles scientifiques
- **Thèses** : Recherche doctorale
- **Consulting** : Études de marché
- **Formation** : Cours d'économétrie

## 🎓 Formation

Ce projet a été réalisé dans le cadre d'une formation en :
- **Économétrie appliquée**
- **Statistiques avancées**
- **Analyse de données**
- **Programmation R**

---

*Ce projet démontre l'application rigoureuse des méthodes économétriques pour l'analyse des marchés immobiliers et l'aide à la décision.* 