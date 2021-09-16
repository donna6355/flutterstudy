import 'package:flutter/material.dart';
import './todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Todos(),
    );
  }
}

// https://flutterpractice-81d03-default-rtdb.asia-southeast1.firebasedatabase.app/
// firebase for flutter pratice