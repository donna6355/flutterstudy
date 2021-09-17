import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../class/todo.dart';

class TodoState extends ChangeNotifier {
  List<Todo> _todoList = [
    Todo(
      id: 'abcdefghijklmnop',
      isDeleted: false,
      isDone: false,
      todo: 'Please enter your tasks!',
    ),
  ];

  List<Todo> get getList {
    return [..._todoList];
  }

  void fetchTodo() async {
    var url = Uri.parse(
        'https://flutterpractice-81d03-default-rtdb.asia-southeast1.firebasedatabase.app/todo.json');
    var response = await http.get(url);
    print(json.decode(response.body));
    notifyListeners();
  }

  void addTodo(String val) async {
    var url = Uri.parse(
        'https://flutterpractice-81d03-default-rtdb.asia-southeast1.firebasedatabase.app/todo.json');
    var response = await http.post(url,
        body: json.encode({
          'todo': val,
          'isDeleted': false,
          'isDone': false,
        }));
    final newTodo = Todo(
      id: json.decode(response.body)['name'],
      isDeleted: false,
      isDone: false,
      todo: val,
    );
    _todoList.add(newTodo);
    notifyListeners();
  }

  void doneStatus(String givenId) {
    print(givenId);
    _todoList[0].isDone = true;
    // need to fix
    notifyListeners();
  }

  void delete(String givenId) {
    _todoList.removeWhere((item) => item.id == givenId);
    notifyListeners();
  }
}
