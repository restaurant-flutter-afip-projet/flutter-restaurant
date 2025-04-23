import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Image.network(item.image, width: 60, fit: BoxFit.cover),
        title: Text(item.title),
        subtitle: Text(item.description),
        trailing: Text('${item.price.toStringAsFixed(2)} €'),
      ),
    );
  }
}
