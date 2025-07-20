# 📚 Application de Gestion de Bibliothèque - Django

## 🎯 Objectif du Projet

Développement d'une application web complète de gestion de bibliothèque utilisant le framework Django. L'application permet la gestion des livres, des utilisateurs et offre une interface moderne et intuitive.

## 🚀 Fonctionnalités

### 📖 Gestion des Livres
- **Ajout de livres** : Titre, auteur, date de publication, description
- **Gestion des images** : Upload et affichage des couvertures de livres
- **Recherche** : Recherche par titre, auteur ou description
- **Catégorisation** : Organisation par genres et thèmes

### 👥 Gestion des Utilisateurs
- **Authentification** : Système de connexion/déconnexion
- **Profils utilisateurs** : Gestion des comptes personnalisés
- **Permissions** : Contrôle d'accès aux fonctionnalités

### 🎨 Interface Utilisateur
- **Design responsive** : Adaptation mobile et desktop
- **Interface moderne** : CSS personnalisé avec animations
- **Navigation intuitive** : Menu de navigation clair
- **Formulaires stylisés** : Interface utilisateur améliorée

## 🛠️ Technologies Utilisées

### Backend
- **Python 3.x** : Langage de programmation principal
- **Django 4.x** : Framework web
- **SQLite** : Base de données
- **Pillow** : Traitement d'images

### Frontend
- **HTML5** : Structure des pages
- **CSS3** : Stylisation et mise en page
- **JavaScript** : Interactivité côté client
- **Bootstrap** : Framework CSS (optionnel)

### Outils de Développement
- **Git** : Contrôle de version
- **Virtual Environment** : Isolation des dépendances
- **Django Admin** : Interface d'administration

## 📁 Architecture du Projet

```
bibliotheque/
├── bibliotheque/           # Configuration principale Django
│   ├── settings.py        # Paramètres de l'application
│   ├── urls.py           # URLs principales
│   └── wsgi.py           # Configuration WSGI
├── booksApp/             # Application principale
│   ├── models.py         # Modèles de données
│   ├── views.py          # Logique métier
│   ├── forms.py          # Formulaires
│   ├── urls.py           # URLs de l'application
│   ├── templates/        # Templates HTML
│   ├── static/           # Fichiers statiques (CSS, JS, images)
│   └── migrations/       # Migrations de base de données
├── media/                # Fichiers uploadés (images)
├── manage.py            # Script de gestion Django
└── db.sqlite3           # Base de données SQLite
```

## 🗄️ Modèle de Données

### Modèle Book
```python
class Book(models.Model):
    id_oeuvre = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=200)
    auteur = models.CharField(max_length=200)
    pub_date = models.DateTimeField("date de publication")
    image = models.ImageField(upload_to='book_images/', null=True, blank=True)
    description = models.TextField(max_length=2000)
```

## 🎨 Interface Utilisateur

### Pages Principales
- **Accueil** : Présentation de la bibliothèque
- **Catalogue** : Liste des livres disponibles
- **Ajouter un livre** : Formulaire d'ajout
- **Détails du livre** : Informations complètes
- **À propos** : Informations sur le projet

### Design
- **Thème moderne** : Interface épurée et professionnelle
- **Responsive design** : Adaptation à tous les écrans
- **Animations CSS** : Transitions fluides
- **Palette de couleurs** : Harmonieuse et accessible

## 🔧 Installation et Configuration

### Prérequis
```bash
Python 3.8+
pip
```

### Installation
```bash
# Cloner le repository
git clone [url-du-repo]

# Créer un environnement virtuel
python -m venv venv
source venv/bin/activate  # Linux/Mac
# ou
venv\Scripts\activate     # Windows

# Installer les dépendances
pip install -r requirements.txt

# Appliquer les migrations
python manage.py migrate

# Créer un superutilisateur
python manage.py createsuperuser

# Lancer le serveur
python manage.py runserver
```

### Configuration
1. **Base de données** : SQLite par défaut (configurable)
2. **Médias** : Dossier `media/` pour les uploads
3. **Statiques** : Dossier `static/` pour CSS/JS

## 📊 Fonctionnalités Techniques

### CRUD Operations
- **Create** : Ajout de nouveaux livres
- **Read** : Affichage et recherche de livres
- **Update** : Modification des informations
- **Delete** : Suppression de livres

### Gestion des Images
- **Upload** : Interface drag & drop
- **Validation** : Types et tailles autorisés
- **Redimensionnement** : Optimisation automatique
- **Stockage** : Organisation en dossiers

### Sécurité
- **CSRF Protection** : Protection contre les attaques CSRF
- **Validation des données** : Contrôle des entrées
- **Permissions** : Contrôle d'accès
- **Sanitisation** : Nettoyage des données

## 🎯 Compétences Développées

### Développement Web
- **Framework Django** : Architecture MVC
- **Templates** : Système de templates Django
- **ORM** : Manipulation de base de données
- **Forms** : Gestion des formulaires

### Frontend
- **HTML/CSS** : Structure et stylisation
- **JavaScript** : Interactivité
- **Responsive Design** : Adaptation mobile
- **UX/UI** : Expérience utilisateur

### Base de Données
- **SQLite** : Base de données légère
- **Migrations** : Gestion des schémas
- **Relations** : Modèles et associations
- **Requêtes** : Optimisation des requêtes

### DevOps
- **Git** : Contrôle de version
- **Environnements virtuels** : Isolation
- **Déploiement** : Configuration serveur
- **Documentation** : Code et API

## 🚀 Améliorations Possibles

### Fonctionnalités
- **Système de prêt** : Gestion des emprunts
- **Notifications** : Rappels et alertes
- **API REST** : Interface programmatique
- **Recherche avancée** : Filtres multiples

### Technique
- **Base de données** : Migration vers PostgreSQL
- **Cache** : Mise en cache des requêtes
- **Tests** : Tests unitaires et d'intégration
- **CI/CD** : Intégration continue

## 📚 Documentation

- **Code** : Commentaires et docstrings
- **README** : Guide d'installation
- **API** : Documentation des endpoints
- **Déploiement** : Guide de mise en production

## 🤝 Contribution

1. Fork le projet
2. Créer une branche feature
3. Commiter les changements
4. Pousser vers la branche
5. Ouvrir une Pull Request

## Equipe

- **SAWADOGO Aurèle**
- **GAMENE Yann**
- **YAMEOGO Saïdou**

## Enseignant

- **Dr BARO**

---

*Ce projet démontre la maîtrise du développement web avec Django et l'application des bonnes pratiques de développement.* 