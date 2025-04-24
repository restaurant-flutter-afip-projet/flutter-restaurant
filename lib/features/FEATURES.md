### Explication de la couche feature 

**_models**
```plaintext
But:
Définir les classes/modèles de données utilisés dans la feature (Booking, Menu, Table, User).

Exemples:
Classe Booking avec id, date, userId, tableId, etc.
Classe User avec id, email, name, etc.
```

**_provider**
```plaintext
-But:
Gérer l’état et la logique de gestion de la feature dans l’UI (avec Provider, ChangeNotifier, Riverpod ou autre).

Exemples:
Méthodes pour charger, ajouter, supprimer, modifier les bookings.
Notifier l’UI des changements d’état.
```

**_repository**
```plaintext
But:
Interface entre l'app et les sources de données (API, DB locale, etc.).
C’est ici que sont faits les appels réseau, avec manipulation des données brutes.

Exemple:
Récupérer la liste des bookings via HTTP.
Ajouter un utilisateur en appelant ton backend FastAPI.
```

**_service**
```plaintext
But:
Contient la logique métier ou les traitements plus complexes spécifiques à la feature qui ne relèvent pas directement de l’accès aux données.

Exemples:

Vérifier qu’une table n’est pas déjà réservée avant d’enregistrer un booking.
Appliquer des règles métiers sur les menus (ex: filtre des plats du jour).
Calculs ou validations spécifiques.
```

**_screen**
```plaintext
But:
Contient l’écran principal (page) de la feature (UI de la page booking, menu, table, users).

Exemples:
Afficher la liste des bookings, détails, actions.
Page de gestion des menus, tables ou utilisateurs.
```

**_widget**
```plaintext
But:
Définir les widgets Flutter réutilisables spécifiques à cette feature.

Exemples:

BookingCard pour afficher une réservation.
MenuItem pour un élément de menu.
Formulaire d’ajout/modif d’un utilisateur ou d’une table.
```