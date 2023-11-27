import 'dart:io';

import 'package:places/data/place_psuedodata.dart';
import 'package:places/models/place_model.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// notifier's a property of riverpod, this is our initial state and watchers
class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  // this is how we're updating the state with riverpod
  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir =
        await syspaths.getApplicationDocumentsDirectory(); //opening directory
    final filename = path
        .basename(image.path); //extracting the file name for the file object
    final copiedImage = await image.copy(
        '${appDir.path}/$filename'); //the object we will be sending to the db

    final newPlace =
        Place(title: title, image: copiedImage, location: location);

    final dbPath = await sql.getDatabasesPath();
    sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) async {
          return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL), addrress TEXT'
            );
        },
        version: 1,
    ); //if db not existing, opening it will create it

    //provided by StateNotifier
    state = [newPlace, ...state];
  }
}

// seededDAta--------------------------->
final placesProvider = Provider((ref) {
  return pseudoPlaces;
});
// ------------------------------------->

final userFavoritePlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
