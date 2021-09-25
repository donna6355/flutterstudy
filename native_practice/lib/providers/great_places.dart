import 'package:flutter/foundation.dart';
// import 'package:location/location.dart';
import 'dart:io';
import './place.dart';
import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(
      String newTitle, File newImg, PlaceLocation newPlc) async {
    final newAddress =
        await LocationHelper.getAddress(newPlc.latitude, newPlc.longitude);
    final updatedPL = PlaceLocation(
        latitude: newPlc.latitude,
        longitude: newPlc.longitude,
        address: newAddress);
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: newTitle,
      image: newImg,
      location: updatedPL,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lng': newPlace.location.longitude,
      'address': newPlace.location.address,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('places');
    _items = dataList.map((item) {
      return Place(
        id: item['id'],
        title: item['title'],
        image: File(item['image']),
        location: PlaceLocation(
            latitude: item['loc_lat'],
            longitude: item['loc_lng'],
            address: item['address']),
      );
    }).toList();
    notifyListeners();
  }
}
