// login_screen.dart
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
  int selectedIndex = 0;
  bool showOption = false;
  String? errorMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/photos-gratuite/personne-versant-boisson-au-guarana-dans-verre-bouteille_23-2150765638.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            color: Colors.black,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (errorMsg != null)
                      ErrorBanner(message: errorMsg!),
                    const Spacer(),
                    const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const AuthTextField(label: "Email", icon: Icons.mail),
                    const Spacer(),
                    const AuthTextField(
                      label: "Password",
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    const Spacer(),
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
                            "Remember Me , FORGET PASSWORD",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    AuthButton(
                      text: "Log In",
                      onPressed: () {
                        setState(() {
                          // simulate une erreur
                          errorMsg = "Invalid email or password.";
                        });
                      },
                    ),
                    const Spacer(),
                    const Center(
                      child: Text(
                        "Don't have a account REGISTER",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
