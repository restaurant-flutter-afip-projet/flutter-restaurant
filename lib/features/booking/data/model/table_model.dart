class Table {
  final int id;
  final int capacity;

  Table({required this.id, required this.capacity});

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
        id: json['id'],
        capacity: json['capacity']
    );
  }

  Map<String, dynamic> convertToJson() {
    return {
      'id': id,
      'capacity': capacity,
    };
  }
}
