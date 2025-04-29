import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/api_links.dart';
import '../../../../core/constants/error_messages.dart';
import '../../../../core/exception/api.dart';
import '../../domain/repository/menu_detail_repository.dart';
import '../model/menu_detail_model.dart';

class MenuDetailService implements MenuItemDetailRepository {
  @override
  Future<List<MenuItemDetail>> fetchMenuDetails() async {
    final url =
        "${ApiConstants.baseRequestURL}"
        "${ApiConstants.menuEndpoint}"
        "${ApiConstants.menuDetailEndpoint}"
        "${ApiConstants.getItems}";

    final res = await http.get(Uri.parse(url));

    final data = _handleResponse(res) as List;

    return data.map((item) => MenuItemDetail.fromJson(item)).toList();
  }

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
