import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../class/todo.dart';

class TodoState extends ChangeNotifier {
  bool init = false;

  List<Todo> _todoList = [];

  List<Todo> get getList {
    if (!init) fetchTodo();
    return [..._todoList];
  }

  void fetchTodo() async {
    var url = Uri.parse(
        'https://flutterpractice-81d03-default-rtdb.asia-southeast1.firebasedatabase.app/todo.json');
    var response = await http.get(url);
    final fetchedData = json.decode(response.body) as Map<String, dynamic>;
    fetchedData.forEach((key, val) => {
          _todoList.add(Todo(
              id: key,
              isDeleted: val['isDeleted'],
              isDone: val['isDone'],
              todo: val['todo']))
        });
    init = true;
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
      todo: val,
    );
    _todoList.add(newTodo);
    notifyListeners();
  }

  void delete(String givenId) async {
    var url = Uri.parse(
        'https://flutterpractice-81d03-default-rtdb.asia-southeast1.firebasedatabase.app/todo/$givenId.json');
    await http.delete(url);
    _todoList.removeWhere((item) => item.id == givenId);
    notifyListeners();
  }
}
