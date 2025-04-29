import 'package:cydrerie/features/booking/data/model/table_model.dart';

class Booking {
  final int id;
  final int userId;
  final DateTime schedule;
  final Table table;

  Booking({
    required this.id,
    required this.userId,
    required this.schedule,
    required this.table,
});
}