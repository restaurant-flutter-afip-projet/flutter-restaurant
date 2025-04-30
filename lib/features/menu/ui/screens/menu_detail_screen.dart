import 'package:flutter/material.dart';
import '../../data/model/menu_detail_model.dart';
import '../widgets/menu_detail_widget.dart';

class MenuDetailScreen extends StatefulWidget {
  const MenuDetailScreen({super.key, required this.menuItemDetail});

  final MenuItemDetail menuItemDetail;

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menuItemDetail.item.name),
      ),
      body: MenuItemDetailWidget(menuItemDetail: widget.menuItemDetail),
    );
  }
}
