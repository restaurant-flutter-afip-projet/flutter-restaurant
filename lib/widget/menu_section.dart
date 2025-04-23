import 'package:flutter/material.dart';
import '../model/menu_item.dart';
import 'menu_item_card.dart';


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
