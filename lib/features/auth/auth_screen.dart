import 'dart:ui';
import 'package:flutter/material.dart';
import 'auth_widgets.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const LoginScreen({super.key, required this.onToggleTheme});

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
                    color: Colors.black.withOpacity(0.5), // semi-transparent noir
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
                            "Login",
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
                            label: "Password",
                            icon: Icons.lock,
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  "Remember Me, FORGET PASSWORD",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          AuthButton(
                            text: "Log In",
                            onPressed: () {
                              setState(() {
                                errorMsg = "Invalid email or password.";
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Don't have an account? REGISTER",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
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
