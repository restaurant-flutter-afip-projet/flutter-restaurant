// import 'package:cydrerie/features/menu/menu_model.dart';
// import 'package:cydrerie/features/menu/menu_repository.dart';
// import 'package:flutter/cupertino.dart';
//
//
// /*
// @Description :
// - ChangeNotifier notifie automatiquement l'UI en cas de changement.
// - `with ChangeNotifier` = héritage
// - Intermédiaire entre l'UI et les données provenant de mon menu repository.
//  */
//
// class MenuProvider with ChangeNotifier {
//
//   // Variable privée permettant de stocker l'injection de dépendance : privée car on veut que seul notre provider est accès aux données
//   final MenuRepository _menuRepository;
//
//   // Injection de dépendance du menu repository à notre provider
//   MenuProvider(this._menuRepository)
//
//   List<MenuItem> _items = [];
//
//   // Booléen privé indiquant si une opération est en cours (ex: chargement depuis serveur)
//
//   bool _isLoading = false;
//
//   String? _error;
//
//
//
//
//
// }