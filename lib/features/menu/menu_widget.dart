import 'package:flutter/material.dart';
import './menu_model.dart';



class MenuSection extends StatelessWidget {
  final String category;
  final List<MenuItem> items;

  const MenuSection({
    required this.category,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Text(
            category,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        ...items.map((item) => MenuItemCard(item: item)),
      ],
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image du plat
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: Image.network(
              item.imgUrl,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  color: Colors.grey.shade300,
                  child: Center(
                    child: Icon(
                      Icons.restaurant,
                      size: 60,
                      color: Colors.grey.shade500,
                    ),
                  ),
                );
              },
            ),
          ),
          // Informations sur le plat
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '${item.price.toStringAsFixed(2)} €',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

