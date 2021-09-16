import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../class/todo.dart';

class TodoState extends ChangeNotifier {
  List<Todo> _todoList = [];

  List<Todo> get getList {
    return [..._todoList];
  }

  void fetchTodo() async {
    var url = Uri.parse('https://example.com/whatsit/create');
    var response = await http.get(url);
    print(response);
    notifyListeners();
  }

  void addTodo(Todo val) {
    // var url = Uri.parse('https://example.com/whatsit/create');
    // var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    _todoList.add(val);
    notifyListeners();
  }
}
