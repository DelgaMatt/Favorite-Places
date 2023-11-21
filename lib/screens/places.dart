import 'package:flutter/material.dart';
import 'package:places/screens/add_places_screen.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({super.key});

  @override
  State<PlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}



class _AddPlaceScreenState extends State<PlaceScreen> {
  
  void _addItemScreen() {
    Navigator.push(context, 
      MaterialPageRoute(builder: (ctx) => const AddPlaceScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Places'), actions: [
        IconButton(onPressed: _addItemScreen, icon: const Icon(Icons.add))
      ]),
      body: const Text('favorite places'),
    );
  }
}
