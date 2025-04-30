import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/register_user_widget.dart';
import '../../../../common/screens/terms_of_use.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? errorMsg;
  bool _conditionRgpd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.network(
              "https://img.freepik.com/photos-gratuite/vue-laterale-du-pate-foie-poulet-tableau-noir-table_140725-12785.jpg?t=st=1745912991~exp=1745916591~hmac=06fbab814d062d8ecc1560bc2ac3474c8444dae3b1d0b58c5a1c1e57cafdc829&w=740",
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
                            "Inscription",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const AuthTextField(label: "Prénom", icon: Icons.account_circle),
                          const SizedBox(height: 20),
                          const AuthTextField(label: "Nom", icon: Icons.account_circle),
                          const SizedBox(height: 20),
                          const AuthTextField(label: "Email", icon: Icons.email),
                          const SizedBox(height: 20),
                          const AuthTextField(label: "Numéro de téléphone", icon: Icons.phone),
                          const SizedBox(height: 20),
                          const AuthTextField(
                            label: "Mot de passe",
                            icon: Icons.lock,
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          const AuthTextField(
                            label: "Confirmer le mot de passe",
                            icon: Icons.lock,
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Checkbox(
                                value: _conditionRgpd,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _conditionRgpd = value ?? false;
                                  });
                                },
                                activeColor: Colors.blueAccent,
                                checkColor: Colors.white,
                              ),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                    children: [
                                      const TextSpan(text: "En cochant cette case, vous acceptez les "),
                                      TextSpan(
                                        text: 'conditions d\'utilisation',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueAccent,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (context) => TermsOfUseScreen())
                                            );
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          RegisterButton(
                            text: "S'inscrire",
                            onPressed: () {
                              setState(() {
                                errorMsg = "Email ou mot de passe invalide.";
                              });
                            },
                          ),
                          const SizedBox(height: 20),
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
