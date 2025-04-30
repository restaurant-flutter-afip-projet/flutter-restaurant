import 'package:cydrerie/features/booking/data/model/table_model.dart';


abstract class TableRepository {
  Future<List<Table>> fetchTables();

  Future<Table> fetchTableById(int id);
}