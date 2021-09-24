import 'package:flutter/foundation.dart';
import 'dart:io';
import './place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<dynamic> _items = [];

  List<dynamic> get items {
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
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('places');
    _items = dataList.map((item) {
      Place(
        id: item['id'],
        title: item['title'],
        image: File(item['image']),
      );
    }).toList();
    notifyListeners();
  }
}
