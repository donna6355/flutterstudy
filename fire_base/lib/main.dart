import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './todos.dart';
import '../provider/todoState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Todos(),
      ),
    );
  }
}

// https://flutterpractice-81d03-default-rtdb.asia-southeast1.firebasedatabase.app/
// url + folder name + json
// 'https://flutterpractice-81d03-default-rtdb.asia-southeast1.firebasedatabase.app/todo.json'
// firebase for flutter pratice