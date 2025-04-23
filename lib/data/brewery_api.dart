import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant/model/brewery_items.dart';

import '../constants/api_links.dart';

class BreweryApi {
  static Future<List<Brewery>> fetchBreweries() async {

    final response = await http.get(Uri.parse(ApiConstants.breweryUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Brewery.fromJson(json)).toList();
    } else {
      throw Exception("Erreur chargement ${response.statusCode}");
    }

  }

}