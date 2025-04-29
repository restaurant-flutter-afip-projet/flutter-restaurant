class MenuItem {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imgUrl;
  final String category;
  final int? dishDetailId;


  /* Déclaration d'un constructeur */
  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imgUrl,
    required this.category,
    this.dishDetailId
  });

  /* Déclaration d'une factory méthode = on ne construit pas l'objet en suivant sa définition de constructueur mais en faisaint un mapping de chaque paire clé valeur que l'objet contient */

  factory MenuItem.fromJson(Map<String, dynamic> json) {

    return MenuItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      imgUrl: json['imgUrl'],
      category: json['category'],
      dishDetailId: json['dishDetailId'],
    );
  }


  Map<String, dynamic> convertToJson() {
    return {
      'id' : id,
      'name' : name,
      'description' : description,
      'price' : price,
      'imgUrl' : imgUrl,
      'category' : category,
      'dishDetailId' : dishDetailId
    };
  }


}