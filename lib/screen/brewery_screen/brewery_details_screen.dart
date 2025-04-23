import 'package:flutter/material.dart';

import '../../model/brewery_items.dart';

import 'package:url_launcher/url_launcher.dart';


class BreweryDetailScreen extends StatelessWidget {
  final Brewery brewery;

  const BreweryDetailScreen({super.key, required this.brewery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brewery.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              brewery.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${brewery.street ?? brewery.address1 ?? "-"}\n'
                        '${brewery.city}, ${brewery.stateProvince} ${brewery.postalCode}\n'
                        '${brewery.country}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (brewery.phone != null && brewery.phone!.isNotEmpty)
              Row(
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(width: 8),
                  Text(brewery.phone!),
                ],
              ),
            const SizedBox(height: 12),
            if (brewery.websiteUrl != null && brewery.websiteUrl!.isNotEmpty)
              Row(
                children: [
                  const Icon(Icons.language),
                  const SizedBox(width: 8),
                  Flexible(
                    child: GestureDetector(
                      onTap: () async {
                        if (brewery.websiteUrl != null && brewery.websiteUrl!.isNotEmpty) {
                          final url = Uri.parse(brewery.websiteUrl!);
                          if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                        }
                      }
                      },
                      child: Text(
                        brewery.websiteUrl!,
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 24),
            Text("Type : ${brewery.breweryType}"),
            if (brewery.latitude != null && brewery.longitude != null)
              Text("Coordonnées : ${brewery.latitude}, ${brewery.longitude}"),
          ],
        ),
      ),
    );
  }
}
