# 📊 TP d'Analyse de Survie - Modélisation des Risques

## 🎯 Objectif du Projet

Développement d'analyses de survie complètes utilisant R pour modéliser les temps de survie et identifier les facteurs de risque. Le projet vise à maîtriser les techniques d'analyse de survie pour l'évaluation des risques et la prédiction des événements.

## 📈 Concepts d'Analyse de Survie

### Définitions
- **Temps de survie** : Durée jusqu'à l'occurrence d'un événement
- **Événement d'intérêt** : Mort, rechute, échec, etc.
- **Censure** : Perte de suivi ou fin d'étude
- **Fonction de survie** : Probabilité de survie au temps t

### Types de Données
- **Données complètes** : Événement observé
- **Données censurées** : Pas d'événement à la fin
- **Données tronquées** : Entrée tardive dans l'étude
- **Données récurrentes** : Événements multiples

## 🛠️ Technologies Utilisées

### Langage R
- **R 4.x** : Langage de programmation statistique
- **RStudio** : Environnement de développement
- **Packages spécialisés** : Analyse de survie

### Packages d'Analyse de Survie
- **survival** : Fonctions de base pour l'analyse de survie
- **survminer** : Visualisation des courbes de survie
- **survivalAnalysis** : Analyses avancées
- **flexsurv** : Modèles de survie flexibles

### Packages de Visualisation
- **ggplot2** : Graphiques de base
- **ggsurvplot** : Courbes de survie
- **plotly** : Graphiques interactifs
- **RColorBrewer** : Palettes de couleurs

### Outils de Reporting
- **R Markdown** : Documents dynamiques
- **Quarto** : Système de publication moderne
- **knitr** : Intégration code/document
- **LaTeX** : Formatage académique

## 📁 Structure du Projet

```
TP d'analyse de Survie/
├── TPsurvie.qmd              # Document principal Quarto
├── data/                     # Données d'analyse
│   ├── survival_data.csv    # Données de survie
│   └── clinical_data.csv    # Données cliniques
├── docs/                    # Documentation
│   ├── survival_guide.pdf   # Guide méthodologique
│   └── examples.pdf         # Exemples d'analyses
└── results/                 # Résultats
    ├── plots/               # Graphiques générés
    └── tables/              # Tableaux de résultats
```

## 📊 Méthodes d'Analyse

### 1. Méthodes Non-Paramétriques
- **Estimateur de Kaplan-Meier** : Fonction de survie empirique
- **Test du log-rank** : Comparaison de courbes de survie
- **Test de Wilcoxon** : Comparaison pondérée
- **Intervalles de confiance** : Précision des estimations

### 2. Méthodes Semi-Paramétriques
- **Modèle de Cox** : Régression de survie
- **Hazard ratio** : Risque relatif
- **Tests de proportionalité** : Validation des hypothèses
- **Modèles stratifiés** : Hétérogénéité des risques

### 3. Méthodes Paramétriques
- **Distribution exponentielle** : Hazard constant
- **Distribution de Weibull** : Hazard variable
- **Distribution log-normale** : Forme flexible
- **Distribution log-logistique** : Forme en U

### 4. Analyses Avancées
- **Modèles à fragilités** : Hétérogénéité non observée
- **Modèles à risques compétitifs** : Événements multiples
- **Modèles de survie accélérée** : Effets sur le temps
- **Modèles de survie additive** : Effets additifs

## 🎨 Visualisations

### Courbes de Survie
- **Courbe de Kaplan-Meier** : Estimation non-paramétrique
- **Courbes comparatives** : Groupes multiples
- **Intervalles de confiance** : Précision des estimations
- **Courbes stratifiées** : Sous-groupes

### Graphiques de Diagnostic
- **Graphique log-log** : Test de proportionalité
- **Graphique de Schoenfeld** : Résidus de Cox
- **Graphique de Martingale** : Linéarité des effets
- **Graphique de deviance** : Points influents

### Graphiques Spécialisés
- **Hazard plots** : Fonction de risque
- **Cumulative hazard** : Risque cumulé
- **Survival plots** : Probabilité de survie
- **Risk tables** : Tableaux de risque

## 🔧 Fonctionnalités Techniques

### Préparation des Données
- **Format survie** : Création d'objets survie
- **Gestion de la censure** : Types de censure
- **Nettoyage** : Valeurs manquantes et outliers
- **Recodage** : Variables catégorielles

### Modélisation
- **Sélection de variables** : Critères d'information
- **Validation croisée** : Robustesse des modèles
- **Tests de diagnostic** : Validation des hypothèses
- **Comparaison de modèles** : Critères de sélection

### Prédiction
- **Prédiction de survie** : Probabilités individuelles
- **Prédiction de risque** : Scores de risque
- **Validation** : Performance prédictive
- **Calibration** : Qualité des prédictions

## 📊 Exemples d'Applications

### Médical
- **Survie des patients** : Cancer, maladies cardiovasculaires
- **Temps de rémission** : Rechutes et récidives
- **Temps de guérison** : Infections et blessures
- **Temps de survie** : Greffes et transplantations

### Économique
- **Durée de chômage** : Retour à l'emploi
- **Durée de vie des entreprises** : Faillites
- **Durée des contrats** : Fidélisation client
- **Temps de remboursement** : Crédits et prêts

### Technique
- **Durée de vie des équipements** : Maintenance
- **Temps de défaillance** : Fiabilité
- **Durée des pannes** : Réparations
- **Temps de service** : Ressources humaines

## 🎯 Compétences Développées

### Statistiques
- **Théorie de la survie** : Concepts fondamentaux
- **Estimation** : Méthodes non-paramétriques
- **Tests d'hypothèses** : Comparaisons de survie
- **Modélisation** : Régression de survie

### Programmation R
- **Packages survival** : Fonctions spécialisées
- **Manipulation d'objets** : Objets survie
- **Visualisation** : Graphiques de survie
- **Modélisation** : Ajustement de modèles

### Interprétation
- **Hazard ratio** : Risque relatif
- **Courbes de survie** : Probabilités
- **Tests de significativité** : Inférence
- **Prédictions** : Applications pratiques

### Reporting
- **R Markdown** : Documents dynamiques
- **Graphiques** : Qualité de publication
- **Tableaux** : Présentation des résultats
- **Interprétation** : Communication des résultats

## 📈 Applications Pratiques

### Recherche Médicale
- **Essais cliniques** : Évaluation de traitements
- **Épidémiologie** : Facteurs de risque
- **Santé publique** : Politiques de prévention
- **Pharmacologie** : Efficacité des médicaments

### Secteur Privé
- **Assurance** : Tarification des risques
- **Finance** : Gestion des crédits
- **Industrie** : Maintenance préventive
- **Marketing** : Fidélisation client

## 🚀 Améliorations Possibles

### Méthodologiques
- **Machine Learning** : Modèles prédictifs avancés
- **Deep Learning** : Réseaux de neurones
- **Bayesian** : Approche bayésienne
- **Multi-state** : Modèles multi-états

### Techniques
- **Big Data** : Grands volumes de données
- **Temps réel** : Analyses en continu
- **Intégration** : Sources multiples
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
- **Statistiques avancées**
- **Analyse de survie**
- **Épidémiologie**
- **Recherche médicale**

## Enseignement

- **Dr Boyam Fabrice YAMEOGO**

---

*Ce projet démontre la maîtrise des techniques d'analyse de survie et leur application dans l'évaluation des risques et la prédiction d'événements.* 