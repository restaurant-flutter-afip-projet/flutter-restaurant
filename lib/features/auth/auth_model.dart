/* Modèles utilisateur, réponse de l’API, etc. */

class AuthRequest {
  final String email;
  final String password;

  AuthRequest({required this.email, required this.password});
}

class AuthResponse {
  final String accessToken;
  final String tokenType;

  AuthResponse({required this.accessToken, required this.tokenType});
}
