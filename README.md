# 🍏 La Cydrerie - Application Flutter

Application mobile/tablette pour la gestion des réservations et de la carte du restaurant "La Cydrerie".  
Ce projet utilise **Flutter** (frontend) et **FastAPI** (backend).

---

## 🏗️ Architecture du projet Flutter

Notre organisation suit une logique **modulaire** inspirée de la Clean Architecture et des bonnes pratiques d’équipe.

### Structure générale

```plaintext
lib/
  core/           # Outils réutilisables, erreurs, accès réseau, utilitaires
  features/       # Chaque bloc fonctionnel majeur = 1 dossier "feature"
    auth/         # Connexion, inscription, gestion de l'utilisateur
    booking/      # Réservations de table (réserver, lister, gérer)
    menu/         # Gestion de la carte du restaurant (CRUD menus)
    table/        # Gestion des tables et capacités
  l10n/           # Gestion des langues
  theme/          # Thèmes graphiques, couleurs, polices
  main.dart       # Point d’entrée de l’app
  router.dart     # Gestion de la navigation entre écrans
```

### Détail d'une feature (exemple: Booking)
Chaque **feature** est organisée de façon à séparer la logique de présentation, d'accès aux données, et de métierq :
```plaintext
features/
    booking/
        data/
            models/
                booking_model.dart
            datasources/
                booking_remote_datasource.dart
            services/
                booking_service.dart
        domain/
            entities/
                booking.dart
            repositories/
                booking_repository.dart
        presentation/
            providers/
                booking_provider.dart
            screens/
                booking_screen.dart
```

--- 

## 🔑 Authentification & Sécurité
- **L’authentification utilise un JWT généré par l’API FastAPI.**
- **Le token JWT est stocké de façon sécurisée (ex : flutter_secure_storage).**
- **Toutes les requêtes protégées ajoutent le JWT dans le header HTTP**
- 
---

## 🔁 Principes clés à retenir

- **Pas de logique métier dans les widgets ou écrans** : elle va dans `domain/` ou `data/`.
- **Pas d’appel réseau direct dans les widgets** : utiliser les `services` dédiés dans `data/`.
- **Un provider gère l’état** (ex : liste de réservations, connexion), il s’interface avec les services.
- **Un widget/écran** consomme uniquement ce dont il a besoin via le provider.

### Exemples de flux

1. **UI ➡️ Provider ➡️ Service ➡️ API ➡️ Provider ➡️ UI**
    - L’écran demande au Provider de charger les réservations.
    - Le Provider utilise `BookingService` pour faire la requête API.
    - Le Service renvoie les données au Provider.
    - Le Provider met à jour l’état, la UI s’actualise.

2. **Ajout d’une feature**
    - Crée les modèles et services dans `features/<mafeature>/data/`
    - Crée une entité et un repository dans `features/<mafeature>/domain/`
    - Crée le provider et les écrans dans `features/<mafeature>/presentation/`

---

## ✨ Pourquoi cette organisation ?

- **Lisibilité** : chaque développeur trouve facilement où intervenir.
- **Modularité** : chaque feature peut évoluer indépendamment.
- **Testabilité** : on peut tester chaque couche séparément.
- **Scalabilité** : facile à ajouter de nouvelles fonctionnalités ou adapter l’architecture.

---

## 🧑‍💻 Pour contribuer

- **Respecte la structure** : chaque nouvelle fonctionnalité est un dossier dans `features/`.
- **Documente** : commente tes méthodes/classes principales.
- **Tests** : Ajoute des tests unitaires dès que possible (dans `test/`).

---

## 📦 Exemple d’arborescence minimale (Booking)


---

## 📚 Ressources utiles

- [Clean Architecture - Flutter](https://resocoder.com/clean-architecture-tdd/)
- [Provider - Flutter](https://pub.dev/packages/provider)
- [Dio pour appels API](https://pub.dev/packages/dio)
- [FastAPI docs](https://fastapi.tiangolo.com/)

---
