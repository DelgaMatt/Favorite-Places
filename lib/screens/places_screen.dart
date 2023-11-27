import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:places/providers/user_places.dart';
import 'package:places/screens/add_places_screen.dart';
import 'package:places/widgets/places_list.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() {
    return _PlacesScreenState();
  }
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {

  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userFavoritePlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
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
        child: FutureBuilder(
          future: _placesFuture, 
          builder: (context, snapshop) => 
          snapshop.connectionState == ConnectionState.waiting 
            ? const Center(child: CircularProgressIndicator(),)
            : PlacesList(places: userPlaces,),
          )
      ),
    );
  }
}
