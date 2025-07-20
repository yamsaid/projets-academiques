# 🎯 Modèle à Variable Instrumentale (VI)

## Présentation du Projet

Ce projet explore l'utilisation des variables instrumentales (VI) pour traiter l'endogénéité dans les modèles économétriques. Il met en œuvre des méthodes avancées d'identification et d'estimation, illustrées par des applications pratiques sur des données réelles.

## Objectifs
- Comprendre le problème d'endogénéité et ses conséquences sur l'estimation.
- Mettre en œuvre la méthode des variables instrumentales (2SLS, etc.).
- Appliquer les tests de validité des instruments.
- Interpréter les résultats économétriques et leurs implications.

## Structure du Projet

```
Modèle à Variable Instrumentale (VI)/
├── Document_VI.pdf                # Support théorique et méthodologique
├── Documentations/                # Articles et ressources complémentaires
├── Pratique/
│   ├── base_educ.csv              # Jeu de données utilisé
│   ├── projet_VI.qmd              # Script Quarto principal (analyse)
│   ├── projet_VI.pdf/tex/log/aux  # Rapport généré et logs
│   └── projet_VI_files/
│       ├── figure-pdf/            # Graphiques générés
│       └── mediabag/              # Ressources Quarto
└── presentation_VI.pdf            # Présentation du projet
```

## Méthodologie
- **Préparation des données** : Nettoyage, exploration, visualisation
- **Spécification du modèle** : Identification des variables endogènes et des instruments
- **Estimation** : Méthode des moindres carrés en deux étapes (2SLS)
- **Tests** : Validité des instruments, sur-identification, robustesse
- **Interprétation** : Analyse des résultats et recommandations

## Technologies et Outils
- **R** (Quarto, R Markdown)
- **Packages** : `AER`, `ivreg`, `tidyverse`, `ggplot2`
- **LaTeX** : Rédaction académique

## Ressources
- [Support théorique](Document_VI.pdf)
- [Script d'analyse](Pratique/projet_VI.qmd)
- [Présentation](presentation_VI.pdf)

## Equipe 

- **KABORE Adeline**
- **GOUBA Leyla**
- **YAMEOGO Saïdou**

## Enseignant

-  **Dr Israël SAWADOGO, Ingénieur Statisticien Economiste (ISE de ENSAE-Dakar)**

---

*Consultez le script Quarto et le rapport PDF pour le détail des analyses et des résultats.* 