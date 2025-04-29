import 'menu_model.dart';

class MenuDetail {
  final MenuItem item;
  final List<String> ingredients;
  final List<String> allergens;
  final List<String> tags;
  final List<String> labels;

  MenuDetail({
    required this.item,
    required this.ingredients,
    required this.allergens,
    required this.tags,
    required this.labels,
  });

  factory MenuDetail.fromJson(Map<String, dynamic> json) {
    return MenuDetail(
      item: MenuItem.fromJson(json['item']),
      ingredients: List<String>.from(json['ingredients']),
      allergens: List<String>.from(json['allergens']),
      tags: List<String>.from(json['tags'] ?? []),
      labels: List<String>.from(json['labels']),
    );
  }
}
