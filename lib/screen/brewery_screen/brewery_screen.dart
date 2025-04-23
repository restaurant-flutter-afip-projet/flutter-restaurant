import 'package:flutter/material.dart';
import 'package:restaurant/screen/brewery_screen/brewery_details_screen.dart';
import '../../data/brewery_api.dart';
import '../../model/brewery_items.dart';

class BreweryScreen extends StatefulWidget {
  const BreweryScreen({super.key});

  @override
  State<BreweryScreen> createState() => _BreweryScreenState();
}

class _BreweryScreenState extends State<BreweryScreen> {
  late Future<List<Brewery>> breweriesFuture;

  @override
  void initState() {
    super.initState();
    breweriesFuture = BreweryApi.fetchBreweries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breweries')),
      body: FutureBuilder<List<Brewery>>(
        future: breweriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucune brasserie trouvée.'));
          }
          final breweries = snapshot.data!;
          return ListView.builder(
            itemCount: breweries.length,
            itemBuilder: (context, index) {
              final brewery = breweries[index];
              return ListTile(
                title: Text(brewery.name),
                subtitle: Text('${brewery.city} (${brewery.country})'),
                trailing: brewery.websiteUrl != null
                    ? Icon(Icons.link)
                    : null,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => BreweryDetailScreen(brewery: brewery),
                      )
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
