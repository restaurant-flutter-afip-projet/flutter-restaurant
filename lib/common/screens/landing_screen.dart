import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/auth/ui/screens/login_screen.dart';
import '../../features/menu/ui/screens/menu_screen.dart';


class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key, required this.onToggleTheme});
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Pas d'app bar pour du full screen
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.network(
              'https://img.freepik.com/photos-gratuite/hamburger-poulet-maison-du-champagne-frites-laitue-tomate-oignon-planche-bois_1150-1857.jpg?t=st=1745566059~exp=1745569659~hmac=f681e9716e7572621d44a447b1e2ac992f7b173a954d62d63168808ded42984b&w=740',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) => Center(child: Icon(Icons.error)),
            ),
          ),
          // Contenu principal
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Barre de navigation
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Bouton profil
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => LoginScreen(onToggleTheme: onToggleTheme))
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                              Icons.person,
                              color: Colors.brown.shade500,
                          ),
                        ),
                      ),
                      Spacer(),
                      // (optionnel) Titre du resto à droite
                      // Text("NomRestau", style: TextStyle(...)),
                    ],
                  ),
                ),
                Spacer(),
                // Nom/logo centré
                Center(
                  child: Column(
                    children: [
                      Text(
                        'La Cydrerie',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 48,
                          color: Colors.white
                        )
                      ),
                      SizedBox(height: 34),
                      // CTA Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade700,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => MenuScreen(onToggleTheme: onToggleTheme))
                          );
                        },
                        child: Text(
                          'Découvrir le menu',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
