# 📈 Économétrie des Séries Temporelles - Modélisation Avancée

## 🎯 Objectif du Projet

Développement d'analyses économétriques avancées dans les séries temporelles avec une approche multilingue (R et Python) et une documentation complète en LaTeX. Le projet vise à maîtriser les modèles de séries temporelles, la modélisation de la volatilité et la prévision économique.

## Problématique

Le Burkina Faso, pays à vocation essentiellement agricole, a longtemps tiré une part importante de ses recettes d’exportation du coton, surnommé “l’or blanc”. Cette culture représente non seulement une source majeure de revenus pour des milliers de producteurs ruraux, mais aussi un levier clé pour la croissance économique nationale. Pourtant, malgré son rôle stratégique, la production cotonnière au Burkina Faso demeure instable et vulnérable aux aléas de plusieurs facteurs.
D’une part, les conditions climatiques, notamment les précipitations, influencent fortement les rendements agricoles dans un pays marqué par une agriculture pluviale.
D’autre part, les variations des prix mondiaux du coton exposent les producteurs aux incerti- tudes du marché international. Enfin, les subventions publiques allouées au secteur (intrants, prix d’achat, infrastructures) apparaissent comme un mécanisme d’amortissement, mais leur régularité et leur eﬀicacité posent également question.
Dans ce contexte, une interrogation centrale se pose : Dans quelle mesure les précipitations, les prix à l’exportation du coton et les subventions publiques influencent-ils la production cotonnière au Burkina Faso entre 1990 et 2023 ?
Autrement dit, quelles sont les relations de court et de long terme entre ces variables, et comment peuvent-elles éclairer les choix de politiques agricoles à venir ?

## 📊 Données Analysées

### Séries Temporelles Économiques
- **coton.csv** : Prix du coton au Burkina Faso
- **data.csv** : Données économiques complémentaires
- **seriTemp.csv** : Séries temporelles de base

### Variables d'Intérêt
- **Prix agricoles** : Évolution des prix du coton
- **Indicateurs économiques** : PIB, inflation, taux de change
- **Variables climatiques** : Précipitations, température
- **Variables temporelles** : Saisonnalité, tendances

## 🛠️ Technologies Utilisées

### Langages de Programmation
- **R** : Analyse statistique et modélisation
- **Python** : Jupyter notebooks et analyse avancée
- **Packages spécialisés** : Séries temporelles et économétrie

### Packages R
- **tseries** : Tests de stationnarité et modèles ARIMA
- **forecast** : Prévisions et modèles de prévision
- **rugarch** : Modèles GARCH et ARCH
- **vars** : Modèles vectoriels autorégressifs
- **strucchange** : Tests de rupture structurelle
- **ggplot2** : Visualisation avancée

### Packages Python
- **pandas** : Manipulation de séries temporelles
- **numpy** : Calculs numériques
- **statsmodels** : Modèles économétriques
- **matplotlib/seaborn** : Visualisation
- **scipy** : Tests statistiques

### Outils de Documentation
- **R Markdown** : Documents dynamiques
- **Quarto** : Publication scientifique
- **LaTeX** : Formatage académique
- **Jupyter** : Notebooks interactifs

## 📁 Structure du Projet

```
Econométrie des séries temporelles/
├── coton.csv                              # Données prix du coton
├── data.csv                               # Données économiques
├── seriTemp.csv                           # Séries temporelles
├── test.ipynb                             # Notebook Python
├── models.Rproj                           # Projet R
├── .RData                                 # Données R sauvegardées
├── .Rhistory                              # Historique des commandes R
├── modelisation.qmd                       # Document Quarto
├── modelisation.tex                       # Fichier LaTeX
├── modelisation.aux                       # Fichier auxiliaire LaTeX
├── modelisation.log                       # Fichier de log
├── modelisation.docx                      # Document Word
├── docs/                                  # Documentation
└── modelisation_files/                    # Fichiers de modélisation
```

## 📊 Modèles Économétriques

### 1. Modèles de Base
- **ARIMA** : Modèles autorégressifs intégrés moyens mobiles
- **SARIMA** : Modèles saisonniers
- **ARMA** : Modèles autorégressifs moyens mobiles
- **VAR** : Modèles vectoriels autorégressifs

### 2. Modèles de Volatilité
- **ARCH** : Hétéroscédasticité conditionnelle autorégressive
- **GARCH** : Modèles GARCH généralisés
- **EGARCH** : GARCH exponentiel
- **TGARCH** : GARCH à seuils

### 3. Modèles Avancés
- **GARCH multivarié** : Volatilités croisées
- **Modèles à changements de régime** : Markov-switching
- **Modèles de cointégration** : Relations à long terme
- **Modèles de causalité** : Tests de Granger

### 4. Tests et Diagnostics
- **Tests de stationnarité** : ADF, KPSS, Phillips-Perron
- **Tests de racine unitaire** : Dickey-Fuller
- **Tests de cointégration** : Engle-Granger, Johansen
- **Tests de diagnostic** : Ljung-Box, ARCH-LM

## 🎨 Types d'Analyses

### Analyse Exploratoire
- **Visualisation temporelle** : Graphiques de séries temporelles
- **Statistiques descriptives** : Moyennes, variances, autocorrélations
- **Tests de stationnarité** : Validation des hypothèses
- **Analyse de la saisonnalité** : Décomposition saisonnière

### Modélisation
- **Identification** : Détermination des ordres des modèles
- **Estimation** : Maximum de vraisemblance
- **Validation** : Tests de diagnostic et résidus
- **Sélection** : Critères d'information (AIC, BIC)

### Prévision
- **Prévisions ponctuelles** : Valeurs futures
- **Intervalles de confiance** : Incertitude statistique
- **Évaluation** : Performance prédictive (RMSE, MAE)
- **Comparaison** : Modèles alternatifs

## 🔧 Fonctionnalités Techniques

### Préparation des Données
- **Nettoyage** : Gestion des valeurs manquantes
- **Transformation** : Différenciation, logarithmes, normalisation
- **Alignement** : Synchronisation temporelle
- **Aggrégation** : Changement de fréquence

### Estimation
- **Maximum de vraisemblance** : Algorithme d'optimisation
- **Robustesse** : Erreurs standards robustes
- **Bootstrap** : Intervalles de confiance
- **Validation croisée** : Performance prédictive

### Diagnostics
- **Résidus** : Tests de normalité et d'autocorrélation
- **Stabilité** : Tests de rupture structurelle
- **Spécification** : Tests de forme fonctionnelle
- **Robustesse** : Sensibilité aux hypothèses

## 📊 Exemples d'Applications

### Marchés Agricoles
- **Prix des matières premières** : Volatilité des prix du coton
- **Rendements agricoles** : Impact des conditions climatiques
- **Politiques agricoles** : Effets des interventions gouvernementales
- **Marchés à terme** : Couverture des risques

### Marchés Financiers
- **Prix des actions** : Volatilité boursière
- **Taux de change** : Volatilité des devises
- **Taux d'intérêt** : Évolution des taux
- **Indices boursiers** : Mouvements de marché

### Économie Réelle
- **PIB** : Croissance économique
- **Inflation** : Évolution des prix
- **Emploi** : Dynamique du marché du travail
- **Commerce** : Flux commerciaux

## 🎯 Compétences Développées

### Économétrie
- **Séries temporelles** : Modèles ARIMA, VAR, GARCH
- **Volatilité** : Modélisation de l'hétéroscédasticité
- **Cointégration** : Relations à long terme
- **Prévision** : Modèles prédictifs

### Statistiques
- **Tests de stationnarité** : Validation des hypothèses
- **Maximum de vraisemblance** : Estimation
- **Tests de diagnostic** : Validation des modèles
- **Critères d'information** : Sélection de modèles

### Programmation
- **R** : Packages spécialisés (tseries, forecast, rugarch)
- **Python** : Jupyter notebooks et analyse avancée
- **Visualisation** : Graphiques temporels et diagnostics
- **Reporting** : Documents dynamiques (Quarto, LaTeX)

### Recherche
- **Méthodologie** : Design d'études temporelles
- **Documentation** : Rapports et publications
- **Reproductibilité** : Code et procédures
- **Communication** : Présentation des résultats

## 📈 Applications Pratiques

### Secteur Privé
- **Finance** : Gestion des risques et trading
- **Assurance** : Tarification des risques
- **Consulting** : Études de marché et prévisions
- **Industrie** : Planification et prévisions

### Secteur Public
- **Banques centrales** : Politique monétaire
- **Ministères** : Politiques économiques
- **Organisations internationales** : Surveillance économique
- **Instituts statistiques** : Prévisions officielles

## 🚀 Améliorations Possibles

### Méthodologiques
- **Machine Learning** : LSTM, réseaux de neurones
- **Deep Learning** : Modèles de deep learning
- **Bayesian** : Approche bayésienne
- **High-frequency** : Données haute fréquence

### Techniques
- **Big Data** : Grands volumes de données
- **Temps réel** : Analyses en continu
- **API** : Données en temps réel
- **Cloud** : Calcul distribué

### Analytiques
- **Analyse multivariée** : Modèles vectoriels
- **Analyse de régimes** : Changements structurels
- **Analyse de causalité** : Relations causales
- **Analyse de robustesse** : Sensibilité des résultats

## 📚 Documentation

### Méthodologique
- **Guide théorique** : Concepts fondamentaux
- **Exemples pratiques** : Cas d'usage
- **Bonnes pratiques** : Recommandations

### Technique
- **Code R/Python** : Scripts et notebooks
- **Documentation** : Commentaires et explications
- **Tests** : Validation des résultats
- **Maintenance** : Mise à jour

## 🎓 Formation

Ce projet a été réalisé dans le cadre d'une formation en :
- **Économétrie des séries temporelles**
- **Modélisation de la volatilité**
- **Programmation R et Python**
- **Analyse de données temporelles**

## Equipe

- **NIKIEMA Moïse**
- **SAWADOGO Latifatou Eddine Esther**
- **YAMEOGO Saïdou**

## Enseignant

- **Mr Gaëtan BASSINGA Ingénieur Statisticien Economiste (ISE de ENSAE-Dakar)**

---

*Ce projet démontre la maîtrise avancée des modèles de séries temporelles et leur application dans l'analyse économique et financière.* 