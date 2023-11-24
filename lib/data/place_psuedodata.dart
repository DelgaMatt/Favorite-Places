import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/models/place_model.dart';

var pseudoPlaces = [
  Place(
    title: 'Portland, Oregon', 
    image: File( const NetworkImage('https://www.hertz.com/content/dam/hertz/global/blog-articles/places-to-go/6-beautiful-spots-to-see-in-portland-oregon/View-of-Portland-Oregon-fall.rendition.xlarge.jpg').toString()), 
    location: const PlaceLocation(latitude: 45.5152, longitude: 122.6784, address: 'Portland, Oregon'))
];
