import 'package:flutter/material.dart';
import '../../data/model/menu_detail_model.dart';

class MenuItemDetailWidget extends StatelessWidget {
  final MenuItemDetail menuItemDetail;

  const MenuItemDetailWidget({super.key, required this.menuItemDetail});

  @override
  Widget build(BuildContext context) {
    final item = menuItemDetail.item;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(item.imgUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(item.description, style: TextStyle(color: Colors.grey[700])),
                const SizedBox(height: 12),
                Text('${item.price.toStringAsFixed(2)} €',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                const Divider(height: 30),
                _buildSection("Ingrédients", menuItemDetail.ingredients),
                _buildSection("Allergènes", menuItemDetail.allergens),
                _buildSection("Tags", menuItemDetail.tags, color: Colors.blueAccent),
                _buildSection("Labels", menuItemDetail.labels, color: Colors.green),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> items, {Color? color}) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color ?? Colors.black)),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            children: items.map((e) => Chip(label: Text(e))).toList(),
          ),
        ],
      ),
    );
  }
}
