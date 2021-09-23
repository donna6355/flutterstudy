import 'package:flutter/foundation.dart';
import 'dart:io';
import './place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String newTitle, File newImg) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: newTitle,
      image: newImg,
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
