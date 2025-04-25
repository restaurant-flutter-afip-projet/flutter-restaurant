import 'dart:convert';
import 'package:cydrerie/core/constants/error_messages.dart';
import 'package:cydrerie/core/exception/api.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/success_messages.dart';
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
  Future<String> deleteMenuItems(int id);
  // Future<MenuItem> updateMenuItem();
  // Future<MenuItem> createMenuItem();
}

class MenuRepositoryImpl implements MenuRepository {

  @override
  Future<List<MenuItem>> fetchMenuItems() async {
    final String fetchMenuItemsURL = ""
        "${ApiConstants.baseRequestURL}"
        "${ApiConstants.menuEndpoint}"
        "${ApiConstants.getItems}" ;

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
      case 500:
        throw ApiException(ErrorMessages.serverError, code: 500);
      default:
        throw ApiException(ErrorMessages.genericApi, code: res.statusCode);
    }
  }

  @override
  Future<String> deleteMenuItems(int id) async {
    final String deleteMenuItemUrl =
        "${ApiConstants.baseRequestURL}"
        "${ApiConstants.menuEndpoint}"
        "${ApiConstants.deleteItem}/"
        "$id";

    final res = await http.delete(Uri.parse(deleteMenuItemUrl));

    if (res.statusCode == 200 || res.statusCode == 204) {
      return SuccessMessages.menuDeleted;
    }

    switch (res.statusCode) {
      case 401:
        throw ApiException(ErrorMessages.unauthorized, code: 401);
      case 404 :
        throw ApiException(ErrorMessages.deleteMenuError, code: 404);
      case 500:
        throw ApiException(ErrorMessages.serverError, code: 500);
      default:
        throw ApiException(ErrorMessages.genericApi, code: res.statusCode);
    }

  }
  //
  // @override
  // Future<MenuItem> updateMenuItem() async {
  // }
  //
  // @override
  // Future<MenuItem> createMenuItem(MenuItem : me) async {
  //
  //   final String createMenuItem =
  //       "${ApiConstants.baseRequestURL}"
  //       "${ApiConstants.menuEndpoint}"
  //       "${ApiConstants.deleteItem}/"
  //       "$id"
  //
  //
  //   final res = await http.post(Uri.parse());
  //
  // }
  //
}