import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditions d\'utilisation'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '1. Introduction',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Bienvenue sur notre application de consultation et de réservation de la Cydrerie. '
                    'En utilisant notre service, vous acceptez les conditions décrites ci-dessous. '
                    'Veuillez les lire attentivement avant de poursuivre.',
              ),
              SizedBox(height: 16),

              Text(
                '2. Services proposés',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Notre application permet aux utilisateurs de consulter la carte de notre restaurant, '
                    'de réserver des tables et de recevoir des confirmations de réservation. '
                    'Les services peuvent évoluer ou être mis à jour sans préavis.',
              ),
              SizedBox(height: 16),

              Text(
                '3. Données collectées',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Nous collectons les données suivantes afin d’assurer le bon fonctionnement de l’application :\n'
                    '- Prénom\n'
                    '- Nom\n'
                    '- Adresse email\n'
                    '- Numéro de téléphone\n'
                    '- Mot de passe (crypté)\n\n'
                    'Ces données sont utilisées pour la gestion des comptes et la réservation',
              ),
              SizedBox(height: 16),

              Text(
                '4. Confidentialité et sécurité',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Vos informations personnelles sont stockées de manière sécurisée. '
                    'Nous nous engageons à ne pas vendre ou partager vos données à des tiers sans votre consentement, sauf dans les cas prévus par la loi.',
              ),
              SizedBox(height: 16),

              Text(
                '5. Responsabilités de l’utilisateur',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Vous êtes responsable de l’exactitude des informations fournies lors de l’inscription. '
                    'Toute utilisation abusive ou frauduleuse de l’application pourra entraîner la suspension ou la suppression de votre compte.',
              ),
              SizedBox(height: 16),

              Text(
                '6. Modifications des conditions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Nous nous réservons le droit de modifier ces conditions à tout moment. '
                    'En continuant à utiliser l’application après une mise à jour, vous acceptez automatiquement les nouvelles conditions.',
              ),
              SizedBox(height: 16),

              Text(
                '7. Contact',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Pour toute question ou demande concernant vos données ou ces conditions, vous pouvez nous contacter à : contact@cydrerie.com',
              ),
              SizedBox(height: 30),
              Text(
                'Merci d\'utiliser notre application !',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
