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

## Equipe

- **NIAMPA Abdoul Fatah**
- **SAWADOGO Pengdwendé Orianne-Aurele**
- **YAMEOGO Saïdou**

## Enseignant

- **Dr Boyam Fabrice YAMEOGO**

---

# Le résumé du projet : Analyse des déterminants du type de logement des ménages urbains au Burkina Faso

*Université Joseph Ki-Zerbo – Institut Supérieur des Sciences de la Population*  
**Licence Professionnelle en Analyse Statistique – 2e année**  
**Groupe 4 – Économétrie des Variables Qualitatives**  
**Réalisé par :** NIAMPA Abdoul Fataho, SAWADOGO Pengdwendé Orianne-Aurele, YAMEOGO Saïdou  
**Encadrant :** Dr. Boyam Fabrice YAMEOGO  
**Date :** Juin 2025  

---

## 🎯 Objectif du rapport

Étudier les facteurs qui influencent le **type de logement** occupé par les ménages urbains au Burkina Faso à partir des données de l’EHCVM (2018), afin de formuler des **recommandations pour l’entreprise ImmoFaso S.A.**

---

## 🧩 Méthodologie

- Utilisation de la **régression logistique multinomiale**.
- Variable dépendante `type_logement` regroupée en 4 catégories.
- Sélection de 8 variables explicatives issues de dimensions **économiques, démographiques, géographiques et résidentielles**.
- Construction de **variables synthétiques** :
  - Score de confort (ACP),
  - Score de qualité du logement,
  - Score socioéconomique (ACM).

---

## 📊 Analyse descriptive

### Variables quantitatives
- **Revenu** : élevé mais inégal.
- **Taille du ménage** : moyenne de 5,6 personnes.
- **Âge du chef de ménage** : moyenne de 46 ans.

### Variables qualitatives
- **Maison individuelle en dur** : type le plus fréquent.
- **Disparités régionales** :
  - Logements modernes dans la région du Centre.
  - Logements en banco dans les régions moins urbanisées.

---

## ⚙️ Traitement et construction des données

- **Imputation des valeurs manquantes** via `mice` (régression polytomique).
- **Traitement des valeurs aberrantes** (méthode IQR).
- **Tests de corrélation** :
  - **Spearman** pour variables quantitatives.
  - **V de Cramér** pour qualitatives.
- **Pas de multicolinéarité** détectée (GVIF < 2).

---

## 🧠 Résultats du modèle logistique multinomial

### Variables significatives
- Score socioéconomique
- Qualité du logement
- Statut d’occupation
- Dépenses du ménage (log-transformées)
- Région de résidence

### Performances du modèle
- **AIC** : 4658.2
- **Pseudo R² de McFadden** : 0.393
- **Précision moyenne (validation croisée 5-folds)** : 67.3 %

### Diagnostics
- Tests LRT et Wald significatifs
- Résidus centrés, symétriques
- Pas de multicolinéarité

---

## 💡 Recommandations pour ImmoFaso S.A.

1. **Segmentation du marché** :
   - Ménages à haut score : logements modernes.
   - Ménages modestes : logements traditionnels / célibatériums abordables.
   - Familles nombreuses : maisons en dur spacieuses.

2. **Stratégie régionale** :
   - Studios au Nord.
   - Logements traditionnels améliorés au Sahel.

3. **Amélioration du confort** :
   - Intégration d’équipements modernes.
   - Solutions hybrides à faible coût.

4. **Statut d’occupation** :
   - Flexibilité locative.
   - Programmes d’accession à la propriété.

5. **Approfondissement analytique** :
   - Enquêtes complémentaires.
   - Exploration de modèles avancés (forêts aléatoires, interactions...).

---

## 🧾 Conclusion

Le modèle logit multinomial révèle que le **type de logement est influencé par des facteurs économiques, sociaux et géographiques**. Il offre à ImmoFaso S.A. une base solide pour une **stratégie immobilière inclusive**, adaptée aux profils variés des ménages urbains burkinabè.

---

*Ce projet démontre la maîtrise des modèles économétriques pour variables qualitatives et leur application dans l'analyse des comportements et des choix.* 