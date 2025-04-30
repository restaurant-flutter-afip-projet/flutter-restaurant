import 'dart:convert';

import 'menu_model.dart';

class MenuItemDetail {
  final MenuItem item;
  final List<String> ingredients;
  final List<String> allergens;
  final List<String> tags;
  final List<String> labels;

  MenuItemDetail({
    required this.item,
    required this.ingredients,
    required this.allergens,
    required this.tags,
    required this.labels,
  });

  factory MenuItemDetail.fromJson(Map<String, dynamic> json) {
    return MenuItemDetail(
      item: MenuItem.fromJson(json['item']),
      ingredients: List<String>.from(json['ingredients']),
      allergens: List<String>.from(json['allergens']),
      tags: List<String>.from(json['tags'] ?? []),
      labels: List<String>.from(json['labels']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'item': jsonEncode(item),
      'ingredients': ingredients,
      'allergens': allergens,
      'tags': tags,
      'labels': labels,
    };
  }

}
