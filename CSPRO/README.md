# 📱 Projet CSPRO - Application de Collecte de Données

## 🎯 Objectif du Projet

Développement d'une application mobile de collecte de données utilisant CSPRO (Census and Survey Processing System) pour l'enquête sur l'épidémie de dengue au Burkina Faso. Le projet vise à maîtriser les outils de collecte de données électroniques et la gestion d'enquêtes épidémiologiques.

## 📋 Contexte de l'Enquête

### Épidémie de Dengue
- **Localisation** : Burkina Faso
- **Période** : Enquête épidémiologique
- **Objectif** : Comprendre la propagation de la dengue
- **Population cible** : Zones touchées par l'épidémie

### Données Collectées
- **Données démographiques** : Âge, sexe, lieu de résidence
- **Données de santé** : Symptômes, antécédents médicaux
- **Données environnementales** : Conditions de vie, eau, assainissement
- **Données comportementales** : Pratiques de prévention

## 🛠️ Technologies Utilisées

### CSPRO
- **CSPRO 7.x** : Logiciel de collecte de données
- **Application mobile** : Collecte sur terrain
- **Base de données** : Stockage et gestion
- **Synchronisation** : Transfert des données

### Fonctionnalités Utilisées
- **Conception de questionnaires** : Interface de création
- **Programmation de logique** : Validation et sauts
- **Gestion des données** : Import/export
- **Synchronisation** : Transfert sécurisé

### Outils Complémentaires
- **ODK** : Open Data Kit (alternative)
- **Excel** : Préparation des données
- **Word** : Documentation
- **PDF** : Rapports finaux

## 📁 Structure du Projet

```
CSPRO/
├── Application capi/                    # Application principale
│   ├── Data.dcf                        # Dictionnaire de données
│   ├── donneesSoumises.csdb            # Base de données
│   ├── package.json                    # Configuration
│   ├── Yams_Capy_Application.cslog     # Fichier de log
│   ├── Yams_Capy_Application.ent       # Fichier d'entrée
│   ├── Yams_Capy_Application.ent.apc   # Configuration APC
│   ├── Yams_Capy_Application.ent.mgf   # Configuration MGF
│   ├── Yams_Capy_Application.ent.qsf   # Configuration QSF
│   ├── Yams_Capy_Application.fmf       # Fichier de format
│   ├── Yams_Capy_Application.pen       # Fichier de pénétration
│   └── Yams_Capy_Application.pff       # Fichier de format
├── dictionnaire/                       # Dictionnaire de données
│   └── Data.dcf                        # Structure des données
└── le questionnaire/                   # Documentation
    └── QUESTIONNAIRE - ENQUETE SUR L'EPIDEMIE DE LA DENGUE AU BURKINA-FASO.docx
```

## 📊 Fonctionnalités de l'Application

### 1. Conception du Questionnaire
- **Interface intuitive** : Questions claires et organisées
- **Logique conditionnelle** : Sauts et validations
- **Types de questions** : Texte, numérique, choix multiples
- **Validation** : Contrôles de qualité des données

### 2. Collecte de Données
- **Mode hors ligne** : Collecte sans connexion
- **Synchronisation** : Transfert des données
- **Gestion des erreurs** : Validation en temps réel
- **Sauvegarde** : Protection contre la perte de données

### 3. Gestion des Données
- **Base de données** : Stockage sécurisé
- **Export** : Formats multiples (CSV, Excel, SPSS)
- **Nettoyage** : Traitement des données
- **Validation** : Contrôles qualité

### 4. Monitoring
- **Suivi en temps réel** : Progression de la collecte
- **Statistiques** : Indicateurs de performance
- **Rapports** : Génération automatique
- **Alertes** : Notifications importantes

## 🎨 Interface Utilisateur

### Écrans Principaux
- **Écran d'accueil** : Menu principal
- **Liste des ménages** : Navigation
- **Questionnaire** : Interface de collecte
- **Validation** : Contrôles de qualité

### Fonctionnalités Interface
- **Navigation intuitive** : Boutons et menus
- **Validation visuelle** : Indicateurs de statut
- **Aide contextuelle** : Instructions intégrées
- **Mode sombre** : Adaptation aux conditions

### Accessibilité
- **Grands boutons** : Facilité d'utilisation
- **Texte lisible** : Taille et contraste
- **Navigation clavier** : Accessibilité
- **Support multilingue** : Langues locales

## 🔧 Fonctionnalités Techniques

### Programmation de Logique
- **Sauts conditionnels** : Navigation intelligente
- **Validation** : Contrôles de cohérence
- **Calculs automatiques** : Formules intégrées
- **Messages d'erreur** : Feedback utilisateur

### Gestion des Données
- **Chiffrement** : Sécurité des données
- **Compression** : Optimisation du stockage
- **Synchronisation** : Transfert sécurisé
- **Sauvegarde** : Protection des données

### Intégration
- **GPS** : Géolocalisation
- **Caméra** : Photos et vidéos
- **Audio** : Enregistrements
- **Barcode** : Codes-barres et QR codes

## 📊 Types de Données Collectées

### Données Démographiques
- **Identité** : Nom, âge, sexe
- **Résidence** : Adresse, quartier
- **Famille** : Composition du ménage
- **Socio-économique** : Niveau d'éducation, revenus

### Données de Santé
- **Symptômes** : Fièvre, douleurs, fatigue
- **Antécédents** : Maladies chroniques
- **Traitements** : Médicaments pris
- **Consultations** : Visites médicales

### Données Environnementales
- **Logement** : Type, matériaux
- **Eau** : Source, stockage
- **Assainissement** : Toilettes, déchets
- **Vecteurs** : Présence de moustiques

### Données Comportementales
- **Prévention** : Moustiquaires, répulsifs
- **Hygiene** : Pratiques d'hygiène
- **Mouvements** : Déplacements récents
- **Exposition** : Activités à risque

## 🎯 Compétences Développées

### CSPRO
- **Conception** : Création de questionnaires
- **Programmation** : Logique et validation
- **Déploiement** : Installation et configuration
- **Maintenance** : Mise à jour et support

### Collecte de Données
- **Méthodologie** : Design d'enquêtes
- **Terrain** : Collecte sur le terrain
- **Qualité** : Contrôles et validation
- **Éthique** : Protection des données

### Épidémiologie
- **Surveillance** : Monitoring épidémiologique
- **Investigation** : Enquêtes d'éclosion
- **Analyse** : Traitement des données
- **Communication** : Rapports et alertes

### Gestion de Projet
- **Planification** : Organisation des enquêtes
- **Coordination** : Équipes de terrain
- **Monitoring** : Suivi des activités
- **Évaluation** : Impact et résultats

## 📈 Applications Pratiques

### Santé Publique
- **Surveillance épidémiologique** : Monitoring des maladies
- **Enquêtes d'éclosion** : Investigation d'épidémies
- **Évaluation d'interventions** : Impact des programmes
- **Recherche** : Études épidémiologiques

### Secteur Privé
- **Études de marché** : Enquêtes consommateurs
- **Satisfaction client** : Évaluation des services
- **Recherche opérationnelle** : Optimisation des processus
- **Formation** : Cours et ateliers

### Secteur Public
- **Recensements** : Démographie et statistiques
- **Évaluation de politiques** : Impact des programmes
- **Monitoring** : Suivi des objectifs
- **Planification** : Données pour la décision

## 🚀 Améliorations Possibles

### Fonctionnalités
- **API** : Intégration avec d'autres systèmes
- **Cloud** : Stockage et synchronisation
- **IA** : Analyse automatique des données
- **Mobile** : Applications natives

### Technique
- **Big Data** : Grands volumes de données
- **Temps réel** : Collecte en continu
- **Blockchain** : Sécurité et traçabilité
- **IoT** : Capteurs et objets connectés

## 📚 Documentation

### Technique
- **Manuel utilisateur** : Guide d'utilisation
- **Documentation technique** : Architecture
- **API** : Interfaces de programmation
- **Maintenance** : Procédures de mise à jour

### Méthodologique
- **Guide d'enquête** : Méthodologie
- **Questionnaire** : Instrument de collecte
- **Protocole** : Procédures de terrain
- **Éthique** : Protection des participants

## 🎓 Formation

Ce projet a été réalisé dans le cadre d'une formation en :
- **Épidémiologie**
- **Collecte de données**
- **Santé publique**
- **Gestion d'enquêtes**

## Enseignant 

- **Mr Mathias WAONGO Ingénieur Statistique Économiste (ISE) à ENSAE-Dakar**

---

*Ce projet démontre la maîtrise des outils de collecte de données électroniques et leur application dans la surveillance épidémiologique.*
