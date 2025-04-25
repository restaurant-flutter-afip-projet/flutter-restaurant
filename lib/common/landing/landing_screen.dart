import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // On enlève l'appBar pour un effet "full screen"
      body: Stack(
        children: [
          // Image de fond (mets ici l'asset ou une image réseau)
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
          // Overlay sombre pour lisibilité
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
                          // Navigue vers la page login/register
                          Navigator.pushNamed(context, '/login');
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                              Icons.person,
                              color: Colors.orange.shade700,
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
                      // Remplace par ton logo si besoin
                      Text(
                        'MonRestau',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 24),
                      // CTA Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade700,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/menu');
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
