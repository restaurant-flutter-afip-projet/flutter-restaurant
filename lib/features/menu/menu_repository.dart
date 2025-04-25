import 'dart:convert';
import 'package:cydrerie/core/constants/error_messages.dart';
import 'package:cydrerie/core/exception/api.dart';
import 'package:http/http.dart' as http;
import 'menu_model.dart';

import '../../core/constants/api_links.dart';


/*
 * @Description :
 * - Le repository représente la couche d'abstraction de la source de données, c'est l'interface entre notre app et le backend d'Oscar
 * - Il centralise toute la logique d'accès à ces dernières (API, cache ... )
 *
 * @Responsabilité :
 * - Récupération, envoi, suppresion ou modification = point de départ des opérations CRUD
 *
 * @Communication :
 * - Directement avec l'UI (qui ne s'occupe pas de savoir d'où provient la donnée
 *
 * @Intérêt :
 * - Tests facilité avec des fausses données (tu ne dépends pas d'une UI ou d'une source de données)
 * - Pas de mélange entre UI et requête HTTP
 */


/*
* @Description
* - Déclare les méthode de notre repository
* - Ne peut être instancié directement
* - Sert de contrat d'interface
* - Séparation du quoi (classe abstraite) du comment (MenuRepositoryImpl)
*/
abstract class MenuRepository {
  Future<List<MenuItem>> fetchMenuItems();
  // Future<void> deleteMenuItems();
  // Future<MenuItem> updateMenuItem();
  // Future<MenuItem> createMenuItem();
}

class MenuRepositoryImpl implements MenuRepository {
  final String fetchMenuItemsURL = "${ApiConstants.baseRequestURL}/${ApiConstants.menuItems}" ;
  
  @override
  Future<List<MenuItem>> fetchMenuItems() async {
    final res = await http.get(Uri.parse(fetchMenuItemsURL));

    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((item) => MenuItem.fromJson(item)).toList();
    }

    switch (res.statusCode) {
      case 401:
        throw ApiException(ErrorMessages.unauthorized, code: 401);
      case 404 :
        throw ApiException(ErrorMessages.menuNotFound, code: 404);
      default:
        throw ApiException(ErrorMessages.genericApi, code: res.statusCode);
    }
  }

  // @override
  // Future<void> deleteMenuItems() async {
  // }
  //
  // @override
  // Future<MenuItem> updateMenuItem() async {
  // }
  //
  // @override
  // Future<MenuItem> createMenuItem() async {
  // }
 
}