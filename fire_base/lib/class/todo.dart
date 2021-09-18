import 'package:flutter/material.dart';

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

  void toggleDone() {
    isDone = !isDone;
    notifyListeners();
  }
}
