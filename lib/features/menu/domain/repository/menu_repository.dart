import '../../data/model/menu_model.dart';

abstract class MenuRepository {
  Future<List<MenuItem>> fetchMenuItems();

  Future<String> deleteMenuItems(int id);

  Future<MenuItem> updateMenuItem(MenuItem menuItem);

  Future<MenuItem> createMenuItem(MenuItem menuItem);
}