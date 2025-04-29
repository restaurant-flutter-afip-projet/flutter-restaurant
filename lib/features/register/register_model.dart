/* Modèles utilisateur, réponse de l’API, etc. */

class RegisterRequest {
  final String firstName;
  final String lastName;
  final int role;
  final String email;
  final String password;
  final String numberPhone;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    required this.password,
    required this.numberPhone
  });
}
