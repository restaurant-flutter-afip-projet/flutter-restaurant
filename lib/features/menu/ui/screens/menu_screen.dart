import 'package:flutter/material.dart';
import '../../data/menu_item_list.dart';
import '../widgets/menu_widget.dart';

class MenuScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const MenuScreen({super.key, required this.onToggleTheme});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late final List<String> categories;
  String selectedCategory = "";

  @override
  void initState() {
    super.initState();
    categories = menuItems.map((e) => e.category).toSet().toList();
    selectedCategory = categories.first;
  }

  @override
  Widget build(BuildContext context) {
    final IconData sunny = Icons.wb_sunny;
    final IconData night = Icons.nightlight_round;

    final categoryFiltered = menuItems
        .where((item) => item.category == selectedCategory)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu du Restaurant'),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark ? sunny : night,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    selectedColor: Theme.of(context).colorScheme.primary,
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          // Liste des plats filtrés
          Expanded(
            child: ListView(
              children: [
                MenuSection(
                  category: selectedCategory,
                  items: categoryFiltered
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
