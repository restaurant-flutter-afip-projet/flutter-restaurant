import '../../data/model/menu_detail_model.dart';

abstract class MenuItemDetailRepository {
  Future<List<MenuItemDetail>> fetchMenuDetails();
  // Future<MenuItemDetail> updateMenuDetails();
}