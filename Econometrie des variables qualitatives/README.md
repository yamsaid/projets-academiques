# 📊 Économétrie des Variables Qualitatives - Modélisation des Choix

## 🎯 Objectif du Projet

Développement d'analyses économétriques spécialisées dans la modélisation des variables qualitatives (binaires, ordinales, nominales) utilisant R. Le projet vise à maîtriser les modèles logit, probit et l'analyse discriminante pour l'étude des comportements et des choix.

## 📈 Types de Variables Qualitatives

### Variables Binaires (Dichotomiques)
- **Présence/Absence** : 0/1, Oui/Non
- **Succès/Échec** : Réussite, adoption
- **Choix binaires** : Acheter/Ne pas acheter
- **Événements** : Décès, faillite, migration

### Variables Ordinales
- **Échelles de satisfaction** : Très insatisfait à Très satisfait
- **Niveaux d'éducation** : Primaire, Secondaire, Supérieur
- **Catégories de revenus** : Faible, Moyen, Élevé
- **Intensité** : Faible, Modérée, Forte

### Variables Nominales
- **Choix multiples** : Mode de transport, marque
- **Catégories** : Secteur d'activité, région
- **Types** : Type de logement, de contrat
- **Préférences** : Couleurs, styles

## 🛠️ Technologies Utilisées

### Langage R
- **R 4.x** : Langage de programmation statistique
- **RStudio** : Environnement de développement
- **Packages spécialisés** : Modélisation qualitative

### Packages Principaux
- **nnet** : Modèles multinomial logit
- **MASS** : Modèles logit/probit et analyse discriminante
- **ordinal** : Modèles logit/probit ordinaux
- **mlogit** : Modèles de choix discrets
- **VGAM** : Modèles vectoriels généralisés

### Packages de Diagnostic
- **car** : Tests de diagnostic
- **lmtest** : Tests économétriques
- **pscl** : Indices de pseudo-R²
- **ResourceSelection** : Tests de Hosmer-Lemeshow

### Outils de Reporting
- **R Markdown** : Documents dynamiques
- **LaTeX** : Formatage académique
- **knitr** : Intégration code/document

## 📁 Structure du Projet

```
Econometrie des variables qualitatives/
├── Groupe4_quali _LPAS2_2024_2025.R        # Script principal
├── Groupe4_quali _LPAS2_2024_2025.Rmd      # Rapport R Markdown
├── Groupe4_quali-_LPAS2_2024_2025.log      # Fichier de log
├── base_projet_quali.feather               # Base de données
├── docs/                                   # Documentation
│   ├── Consignes.pdf                      # Instructions du projet
│   ├── Hedonic_House_Price_Index_très_important_aussi.pdf
│   ├── Hedonic_House_Price_Index_très_important.pdf
│   ├── Hill_article_important.pdf
│   ├── imet128.pdf
│   ├── Mémoire Hubert Maldague version complète définitive.pdf
│   ├── rapport.pdf
│   └── S06_3_ACTE_VIGNOLLES_JMS2015_v2_OK.pdf
├── TP/                                    # Travaux pratiques
│   └── TPQUALI.R                         # Script TP
├── TP_Quanti_Grp.Rproj                   # Projet R
├── logo.jpg                              # Logo
├── preamble.tex                          # Préambule LaTeX
└── titlepage.tex                         # Page de titre
```

## 📊 Modèles Économétriques

### 1. Modèles Logit/Probit
- **Logit** : Fonction de répartition logistique
- **Probit** : Fonction de répartition normale
- **Interprétation** : Effets marginaux et odds ratios
- **Diagnostics** : Tests de spécification

### 2. Modèles Multinomiaux
- **Logit multinomial** : Choix multiples non ordonnés
- **Logit conditionnel** : Choix avec caractéristiques alternatives
- **Logit mixte** : Hétérogénéité des préférences
- **Nested logit** : Structure hiérarchique des choix

### 3. Modèles Ordinaux
- **Logit ordinal** : Variables ordonnées
- **Probit ordinal** : Distribution normale
- **Modèles à seuils** : Seuils de transition
- **Modèles proportionnels** : Hypothèse de proportionnalité

### 4. Analyse Discriminante
- **Discriminante linéaire** : LDA
- **Discriminante quadratique** : QDA
- **Classification** : Règles de décision
- **Validation** : Performance prédictive

## 🎨 Types d'Analyses

### Analyse Exploratoire
- **Statistiques descriptives** : Résumés par catégories
- **Tableaux croisés** : Relations entre variables
- **Graphiques** : Distributions et associations
- **Tests d'indépendance** : Chi², V de Cramér

### Modélisation
- **Sélection de variables** : Critères d'information
- **Spécification** : Forme fonctionnelle
- **Estimation** : Maximum de vraisemblance
- **Validation** : Tests de diagnostic

### Interprétation
- **Coefficients** : Signe et significativité
- **Effets marginaux** : Impact sur les probabilités
- **Odds ratios** : Risques relatifs
- **Prédictions** : Probabilités individuelles

## 🔧 Fonctionnalités Techniques

### Préparation des Données
- **Recodage** : Transformation des variables
- **Dummy variables** : Variables indicatrices
- **Interactions** : Effets d'interaction
- **Standardisation** : Variables centrées-réduites

### Estimation
- **Maximum de vraisemblance** : Algorithme d'optimisation
- **Robustesse** : Erreurs standards robustes
- **Bootstrap** : Intervalles de confiance
- **Jackknife** : Validation croisée

### Diagnostics
- **Tests de spécification** : Ramsey, Link
- **Tests de normalité** : Résidus
- **Tests d'hétéroscédasticité** : Breusch-Pagan
- **Tests de multicolinéarité** : VIF

## 📊 Exemples d'Applications

### Économie de la Santé
- **Adoption de comportements** : Vaccination, dépistage
- **Utilisation des services** : Consultations, hospitalisations
- **Compliance** : Suivi des traitements
- **Qualité de vie** : Échelles ordinales

### Économie du Travail
- **Participation au marché** : Emploi, chômage
- **Choix d'éducation** : Niveau, filière
- **Mobilité** : Changement d'emploi, migration
- **Satisfaction** : Échelles ordinales

### Économie de la Consommation
- **Choix de produits** : Marques, modèles
- **Adoption d'innovations** : Technologies, services
- **Préférences** : Couleurs, styles
- **Comportements** : Recyclage, économies

### Finance
- **Défaut de paiement** : Crédits, obligations
- **Choix d'investissement** : Actions, obligations
- **Risque** : Catégories de risque
- **Performance** : Classes de performance

## 🎯 Compétences Développées

### Économétrie
- **Modèles qualitatifs** : Logit, probit, multinomial
- **Estimation** : Maximum de vraisemblance
- **Interprétation** : Effets marginaux, odds ratios
- **Diagnostics** : Tests de spécification

### Statistiques
- **Tests d'hypothèses** : Inférence statistique
- **Classification** : Analyse discriminante
- **Prédiction** : Probabilités et scores
- **Validation** : Performance prédictive

### Programmation R
- **Packages spécialisés** : nnet, MASS, ordinal
- **Modélisation** : Estimation et diagnostics
- **Visualisation** : Graphiques spécialisés
- **Reporting** : R Markdown et LaTeX

### Recherche
- **Méthodologie** : Design d'études
- **Documentation** : Rapports et publications
- **Reproductibilité** : Code et procédures
- **Communication** : Présentation des résultats

## 📈 Applications Pratiques

### Recherche Académique
- **Thèses** : Recherche doctorale
- **Articles** : Publications scientifiques
- **Présentations** : Conférences
- **Collaborations** : Projets de recherche

### Secteur Privé
- **Marketing** : Études de comportement
- **Finance** : Scoring et risque
- **Assurance** : Tarification
- **Consulting** : Études de marché

### Secteur Public
- **Santé** : Politiques de santé
- **Éducation** : Politiques éducatives
- **Social** : Politiques sociales
- **Transport** : Planification des transports

## 🚀 Améliorations Possibles

### Méthodologiques
- **Machine Learning** : Random Forest, SVM
- **Deep Learning** : Réseaux de neurones
- **Bayesian** : Approche bayésienne
- **Semi-paramétrique** : Modèles flexibles

### Techniques
- **Big Data** : Grands volumes
- **Temps réel** : Prédictions en continu
- **API** : Services web
- **Cloud** : Calcul distribué

## 📚 Documentation

### Méthodologique
- **Guide théorique** : Concepts fondamentaux
- **Exemples pratiques** : Cas d'usage
- **Bonnes pratiques** : Recommandations
- **Limitations** : Précautions d'usage

### Technique
- **Code R** : Scripts et fonctions
- **Documentation** : Commentaires et explications
- **Tests** : Validation des résultats
- **Maintenance** : Mise à jour

## 🎓 Formation

Ce projet a été réalisé dans le cadre d'une formation en :
- **Économétrie appliquée**
- **Statistiques avancées**
- **Modélisation qualitative**
- **Programmation R**

---

*Ce projet démontre la maîtrise des modèles économétriques pour variables qualitatives et leur application dans l'analyse des comportements et des choix.* 