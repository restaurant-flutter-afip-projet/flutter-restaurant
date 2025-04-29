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

  Future<MenuItem> updateMenuItem(MenuItem menuItem);

  Future<MenuItem> createMenuItem(MenuItem menuItem);
}


class MenuRepositoryImpl implements MenuRepository {
  @override
  Future<List<MenuItem>> fetchMenuItems() async {
    final url = "${ApiConstants.baseRequestURL}${ApiConstants.menuEndpoint}${ApiConstants.getItems}";

    final res = await http.get(Uri.parse(url));

    final data = _handleResponse(res) as List;


    return data.map((item) => MenuItem.fromJson(item)).toList();
  }

  @override
  Future<String> deleteMenuItems(int id) async {
    final url = "${ApiConstants.baseRequestURL}${ApiConstants.menuEndpoint}${ApiConstants.deleteItem}/$id";

    final res = await http.delete(Uri.parse(url));
    _handleResponse(res);
    return SuccessMessages.menuDeleted;
  }

  @override
  Future<MenuItem> updateMenuItem(MenuItem menuItem) async {
    final url = "${ApiConstants.baseRequestURL}${ApiConstants.menuEndpoint}${ApiConstants.updateItem}/${menuItem.id}";

    final res = await http.patch(
      Uri.parse(url),
      headers: _headers,
      body: jsonEncode(menuItem.convertToJson()),
    );

    final data = _handleResponse(res);
    return MenuItem.fromJson(data);
  }

  @override
  Future<MenuItem> createMenuItem(MenuItem menuItem) async {
    final url = "${ApiConstants.baseRequestURL}${ApiConstants.menuEndpoint}${ApiConstants.createItem}";

    final res = await http.post(
          Uri.parse(url),
      headers: _headers,
      body: jsonEncode(menuItem.convertToJson()),
    );

    final data = _handleResponse(res);


    return MenuItem.fromJson(data);
  }

  // Méthodes propres à notre classe pour gérer les réponses et obtenir le type
  dynamic _handleResponse(http.Response res) {
    if (res.statusCode >= 200 && res.statusCode < 300) {
      if (res.body.isNotEmpty) {
        return jsonDecode(res.body);
      } else {
        return null;
      }
    }

    switch (res.statusCode) {
      case 401:
        throw ApiException(ErrorMessages.unauthorized, code: 401);
      case 404:
        throw ApiException(ErrorMessages.menuNotFound, code: 404);
      case 500:
        throw ApiException(ErrorMessages.serverError, code: 500);
      default:
        throw ApiException(ErrorMessages.genericApi, code: res.statusCode);
    }
  }

  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'User-Agent': 'CydrerieApp/1.0.0'
  };
}
