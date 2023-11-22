import 'dart:io';
import 'package:places/models/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// notifier's a property of riverpod, this is our initial state and watchers
class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  // this is how we're updating the state with riverpod
  void addPlace(String title, File image) {
    final newPlace = Place(title: title, image: image);
    // provided by StateNotifier
    state = [newPlace, ...state];
  }
}

final userFavoritePlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
