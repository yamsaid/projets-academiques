# 🗺️ Projet QGIS - Cartographie Sanitaire et Démographique

## 🎯 Objectif du Projet

Développement d'un projet de cartographie thématique utilisant QGIS pour analyser et visualiser des données sanitaires et démographiques. Le projet vise à créer des cartes informatives pour l'aide à la décision en santé publique.

## 📊 Données Analysées

### Données Démographiques
- **Population** : Répartition démographique par région
- **Décès néonatals** : Analyse de la mortalité infantile
- **Proportion de femmes** : Répartition par genre
- **Incidence** : Taux d'incidence de phénomènes sanitaires

### Données Sanitaires
- **Indicateurs de santé** : Données épidémiologiques
- **Infrastructures** : Localisation des centres de santé
- **Accessibilité** : Distance aux services de santé

## 🛠️ Technologies Utilisées

### Logiciels SIG
- **QGIS 3.x** : Logiciel principal de cartographie
- **Extensions QGIS** : Outils spécialisés
- **Plugins** : Fonctionnalités avancées

### Formats de Données
- **Shapefiles (.shp)** : Données vectorielles
- **Geodatabase** : Base de données spatiales
- **CSV** : Données tabulaires géoréférencées
- **Raster** : Images satellitaires et cartes

### Outils de Traitement
- **Spatial Analysis** : Analyse spatiale avancée
- **Geoprocessing** : Traitement géographique
- **Statistical Analysis** : Analyse statistique spatiale

## 📁 Structure du Projet

```
QGIS/
├── projets/
│   ├── project2.qgz              # Projet principal QGIS
│   └── projet_deces_neon.qgz     # Projet spécialisé mortalité
├── Couches/
│   ├── BF_adm0_UTM.*            # Frontières nationales
│   ├── BF_adm1_UTM.*            # Régions administratives
│   ├── BF_adm2_UTM.*            # Provinces
│   ├── CT_*.shp                 # Données thématiques
│   └── centroides_*.shp         # Points centraux
├── Data/
│   ├── Base.xlsx                # Données sources
│   └── Base.xlsx.Base_Finalisee.vrt
├── Cartes/
│   ├── CT_deces_propf.jpeg      # Carte mortalité
│   ├── CT_INCID.jpeg            # Carte incidence
│   ├── CT_prop04km.jpeg         # Carte proportion
│   ├── CT_propFem.jpeg          # Carte femmes
│   ├── CT_ratio.jpeg            # Carte ratio
│   ├── PROP.jpeg                # Carte proportion générale
│   └── trois_pheno.jpeg         # Carte trois phénomènes
└── docs/
    └── guide_d'utilisation_QGIS.pdf
```

## 🗺️ Cartes Produites

### 1. Carte de Mortalité Néonatale
- **Fichier** : `CT_deces_propf.jpeg`
- **Objectif** : Visualiser la répartition de la mortalité infantile
- **Méthode** : Choroplèthe par province
- **Légende** : Classes de mortalité par couleur

### 2. Carte d'Incidence
- **Fichier** : `CT_INCID.jpeg`
- **Objectif** : Montrer les taux d'incidence par région
- **Méthode** : Cartographie par cercles proportionnels
- **Analyse** : Identification des zones à risque

### 3. Carte de Proportion de Femmes
- **Fichier** : `CT_propFem.jpeg`
- **Objectif** : Analyser la répartition démographique par genre
- **Méthode** : Choroplèthe avec seuils personnalisés
- **Interprétation** : Déséquilibres démographiques

### 4. Carte de Ratio
- **Fichier** : `CT_ratio.jpeg`
- **Objectif** : Calculer et visualiser des ratios sanitaires
- **Méthode** : Classification automatique
- **Application** : Indicateurs de performance

### 5. Carte Multi-phénomènes
- **Fichier** : `trois_pheno.jpeg`
- **Objectif** : Synthèse de trois indicateurs
- **Méthode** : Combinaison de variables
- **Valeur ajoutée** : Vue d'ensemble intégrée

## 🔍 Méthodologie de Travail

### 1. Préparation des Données
- **Nettoyage** : Correction des erreurs et incohérences
- **Géoréférencement** : Association coordonnées géographiques
- **Projection** : Système de coordonnées UTM
- **Validation** : Contrôle qualité des données

### 2. Analyse Spatiale
- **Interpolation** : Estimation de valeurs manquantes
- **Aggrégation** : Regroupement par unités administratives
- **Calcul d'indices** : Création d'indicateurs composites
- **Tests statistiques** : Validation des résultats

### 3. Cartographie
- **Classification** : Définition des classes de valeurs
- **Symbologie** : Choix des couleurs et symboles
- **Étiquetage** : Ajout de textes informatifs
- **Mise en page** : Composition finale

## 🎯 Compétences Développées

### Systèmes d'Information Géographique
- **QGIS** : Maîtrise du logiciel principal
- **Données vectorielles** : Points, lignes, polygones
- **Données raster** : Images et grilles
- **Projections** : Systèmes de coordonnées

### Analyse Spatiale
- **Géostatistique** : Analyse statistique spatiale
- **Interpolation** : Estimation de valeurs
- **Buffer analysis** : Zones d'influence
- **Overlay** : Superposition de couches

### Cartographie
- **Thématique** : Cartes de données
- **Choroplèthe** : Cartes par zones colorées
- **Symboles proportionnels** : Cercles de taille variable
- **Mise en page** : Composition cartographique

### Traitement de Données
- **Géoréférencement** : Positionnement géographique
- **Projection** : Transformation de coordonnées
- **Validation** : Contrôle qualité
- **Export** : Formats multiples

## 📊 Applications Pratiques

### Santé Publique
- **Planification sanitaire** : Localisation des besoins
- **Surveillance épidémiologique** : Suivi des phénomènes
- **Allocation de ressources** : Optimisation des moyens
- **Évaluation d'impact** : Mesure des interventions

### Décision Politique
- **Aide à la décision** : Données spatialisées
- **Planification territoriale** : Aménagement du territoire
- **Gestion des risques** : Identification des zones sensibles
- **Communication** : Visualisation pour le public

## 🚀 Améliorations Possibles

### Fonctionnalités
- **Cartes interactives** : Web mapping
- **Analyse temporelle** : Évolution dans le temps
- **Modélisation** : Prédiction spatiale
- **3D** : Visualisation en trois dimensions

### Technique
- **Base de données spatiale** : PostgreSQL/PostGIS
- **Automatisation** : Scripts Python/QGIS
- **API** : Services web géographiques
- **Mobile** : Applications mobiles

## 📚 Documentation

### Guides
- **Guide d'utilisation QGIS** : Manuel technique
- **Méthodologie** : Procédures de travail
- **Légendes** : Explication des cartes
- **Métadonnées** : Description des données

### Formats de Sortie
- **Images** : JPEG, PNG haute résolution
- **PDF** : Documents vectoriels
- **Web** : Cartes interactives
- **Print** : Formats d'impression

## 🎓 Formation

Ce projet a été réalisé dans le cadre d'une formation en :
- **Systèmes d'Information Géographique**
- **Cartographie thématique**
- **Analyse spatiale**
- **Santé publique**

---

*Ce projet démontre la maîtrise des outils SIG et leur application dans l'analyse de données sanitaires et démographiques.* 