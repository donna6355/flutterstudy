import 'package:flutter/material.dart';
import './screens/chat.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Chat',
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
          ),
          home: Chat(),
        );
      },
    );
  }
}
