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


  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
        id: json['id'],
        userId: json['userId'],
        schedule: json['schedule'],
        table: json['table'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'capacity': userId,
      'schedule': schedule,
      'table': table,
    };
  }
}