import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:places/providers/user_places.dart';
import 'package:places/screens/add_places_screen.dart';
import 'package:places/widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final userPlaces = ref.watch(userFavoritePlacesProvider);

    // seeded Data --- Uncomment above ------------------------->
    final userPlaces = ref.watch(placesProvider);
    // ---------------------------------------->


    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: PlacesList(
          places: userPlaces,
        ),
      ),
    );
  }
}
