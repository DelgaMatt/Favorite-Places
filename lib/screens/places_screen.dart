import 'package:flutter/material.dart';
import 'package:places/screens/add_places_screen.dart';
import 'package:places/widgets/places_list.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() {
    return _AddPlacesScreenState();
  }
}

class _AddPlacesScreenState extends State<PlacesScreen> {

  void _addItemScreen() {
    Navigator.push(context, 
      MaterialPageRoute(builder: (ctx) => const AddPlaceScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Places'), 
      actions: [
        IconButton(onPressed: _addItemScreen, icon: const Icon(Icons.add))
      ]),
      body: const PlacesList(places: [])
      );
  }
}
