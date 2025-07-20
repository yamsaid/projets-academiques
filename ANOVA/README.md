# 📊 Projet ANOVA - Impact des Écoles Secondaires

## 🎯 Objectif du Projet

Ce projet évalue l'impact de la construction d'écoles secondaires dans certains villages sur l'achèvement de l'école primaire par les individus. L'analyse utilise la méthode de double différence pour identifier l'effet causal de cette intervention éducative.

## 📋 Contexte

L'étude porte sur deux cohortes d'âge (jeunes et plus âgés en 1995) vivant dans des villages avec ou sans école secondaire. L'objectif est de déterminer si la construction d'écoles secondaires a eu un effet causal sur la réussite en primaire, en particulier pour les jeunes exposés à cette nouvelle infrastructure.

## 🛠️ Technologies Utilisées

- **R** : Analyse statistique et modélisation
- **R Markdown** : Création de rapports dynamiques
- **LaTeX** : Formatage des documents académiques
- **Packages R** : `haven`, `questionr`, `dplyr`, `knitr`

## 📊 Méthodologie

### Méthode de Double Différence
La méthode de double différence permet de comparer l'évolution des taux de scolarisation entre les groupes, en neutralisant :
- Les différences initiales entre villages
- Les tendances communes à tous les villages

### Variables d'Analyse
- **Variable dépendante** : Achèvement de l'école primaire (`primary`)
- **Variable de traitement** : Présence d'une école secondaire (`treat`)
- **Variables de contrôle** : Âge, sexe, accès à l'électricité, eau potable, distance à la capitale

## 📈 Résultats Principaux

### Statistiques Descriptives
- **Groupe de traitement** : 90.2% d'achèvement primaire
- **Groupe de contrôle** : 79.4% d'achèvement primaire
- **Différence brute** : +10.7 points de pourcentage

### Tests Statistiques
- **Test t de Welch** : Différence significative au seuil de 1%
- **Contrôles de robustesse** : Variables de contrôle incluses
- **Analyse par sexe** : Effets différenciés selon le genre

### Modèles Économétriques
1. **Régression simple** : Impact brut du traitement
2. **Régression contrôlée** : Avec variables de contrôle
3. **Modèles spécifiques par sexe** : Analyse des effets différenciés

## 📁 Structure des Fichiers

```
ANOVA/
├── projet_anova_script.Rmd    # Script principal d'analyse
├── data_anova.dta            # Base de données
├── rapport.pdf               # Rapport final
├── preamble.tex             # Préambule LaTeX
├── titlepage.tex           # Page de titre
└── ANOVA.Rproj             # Projet R
```

## 🔍 Compétences Développées

### Statistiques
- **Analyse de variance (ANOVA)**
- **Tests d'hypothèses** (test t de Welch)
- **Statistiques descriptives**
- **Tests de robustesse**

### Économétrie
- **Méthode de double différence**
- **Régression linéaire multiple**
- **Contrôle de variables**
- **Inférence causale**

### Programmation
- **R** : Manipulation de données, modélisation
- **R Markdown** : Création de rapports reproductibles
- **LaTeX** : Formatage académique

## 📊 Interprétation des Résultats

### Effet Principal
La construction d'écoles secondaires a un effet positif et statistiquement significatif sur l'achèvement de l'école primaire (+10.7 points de pourcentage).

### Limitations
- **Biais de sélection** : Les villages traités sont plus proches de la capitale
- **Variables omises** : Autres facteurs non observés
- **Généralisabilité** : Résultats spécifiques au contexte étudié

### Recommandations
1. **Contrôles supplémentaires** : Inclure plus de variables de contrôle
2. **Analyse de robustesse** : Tests de sensibilité
3. **Études complémentaires** : Réplication dans d'autres contextes

## 🎓 Applications Pratiques

Cette étude peut informer :
- **Politiques éducatives** : Priorisation des investissements
- **Planification territoriale** : Localisation des écoles
- **Évaluation d'impact** : Méthodologie pour d'autres interventions

## 📚 Références

- Méthode de double différence
- Tests économétriques
- Analyse d'impact en éducation

## Equipe

- **GOUBA Leyla**
- **YAMEOGO Saïdou**

## Enseignant

- **Dr Israël SAWADOGO, Ingénieur Statisticien Economiste (ISE de ENSAE-Dakar)**

---

*Ce projet démontre l'application rigoureuse de méthodes économétriques pour l'évaluation d'impact de politiques publiques.* 