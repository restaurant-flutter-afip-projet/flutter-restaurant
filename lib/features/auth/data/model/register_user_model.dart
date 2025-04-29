class RegisterUserModel {
  final String firstName;
  final String lastName;
  final int role;
  final String email;
  final String password;
  final String phoneNumber;

  RegisterUserModel({
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> convertToJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'role': role,
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
  };
}
