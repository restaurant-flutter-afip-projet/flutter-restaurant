import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'register_user_screen.dart';
import '../widgets/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onToggleTheme});
  final VoidCallback onToggleTheme;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.network(
              "https://img.freepik.com/photos-gratuite/personne-versant-boisson-au-guarana-dans-verre-bouteille_23-2150765638.jpg",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error)),
            ),
          ),
          // Flou + formulaire
          Positioned.fill(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(128, 0, 0, 0), // semi-transparent noir
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (errorMsg != null) ErrorBanner(message: errorMsg!),
                          const SizedBox(height: 20),
                          const Text(
                            "Connexion",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const AuthTextField(label: "Email", icon: Icons.mail),
                          const SizedBox(height: 20),
                          const AuthTextField(
                            label: "Mot de passe",
                            icon: Icons.lock,
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'MOT DE PASSE OUBLIÉ',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Action quand on clique sur Forget
                                          print('mot de passe oublié cliqué');
                                          // Exemple : Navigator.push(...)
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          AuthButton(
                            text: "Se Connecter",
                            onPressed: () {
                              setState(() {
                                errorMsg = "Email ou mot de passe invalide.";
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              children: [
                                const TextSpan(text: "Vous n'avez pas de compte ? "),
                                TextSpan(
                                  text: 'S\'INSCRIRE',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => RegisterScreen())
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
