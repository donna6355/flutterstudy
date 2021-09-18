import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Todo extends ChangeNotifier {
  final String todo;
  bool isDone;
  bool isDeleted;
  final String id;

  Todo(
      {required this.id,
      required this.todo,
      this.isDone = false,
      this.isDeleted = false});

  void toggleDone(String givenId) async {
    var url = Uri.parse(
        'https://flutterpractice-81d03-default-rtdb.asia-southeast1.firebasedatabase.app/todo/$givenId.json');
    await http.patch(url, body: json.encode({'isDone': !isDone}));
    isDone = !isDone;
    notifyListeners();
  }
}
