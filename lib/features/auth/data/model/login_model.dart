/* Modèles utilisateur, réponse de l’API, etc. */

class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});
}

class LoginResponse {
  final String accessToken;
  final String tokenType;

  LoginResponse({required this.accessToken, required this.tokenType});
}
