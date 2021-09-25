import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';
import './screens/place_list.dart';
import './screens/add_place.dart';
import './screens/place_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlaceList(),
        routes: {
          '/addplace': (ctx) => AddPlace(),
          '/placedetail': (ctx) => PlaceDetail(),
        },
      ),
    );
  }
}
