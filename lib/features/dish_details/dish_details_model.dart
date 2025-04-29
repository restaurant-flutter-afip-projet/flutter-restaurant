class DishDetail {

  final int id;
  final String composition;
  final String allergens;
  final int menuItemId;
  final String labelImage;

  DishDetail({
    required this.id,
    required this.composition,
    required this.allergens,
    required this.menuItemId,
    required this.labelImage
  });

  factory DishDetail.fromJson(Map<String, dynamic> json) {
    return DishDetail(
      id: json['id'],
      composition: json['composition'],
      allergens: json['allergens'],
      menuItemId: json['menuItemId'],
      labelImage: json['labelImage']
    );
  }
}