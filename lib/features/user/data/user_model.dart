class User {
  final int id;
  final String firstName;
  final String lastName;
  final int role;
  final String email;
  final String password;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? bookingId;


  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    this.bookingId,
  });
}
