import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todoState.dart';
import '../class/todo.dart';

class Todoinput extends StatelessWidget {
  final taskControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[50],
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            controller: taskControl,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              labelText: 'What you gotta to do?',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TodoState>(context, listen: false).addTodo(Todo(
                  isDeleted: false, isDone: false, todo: taskControl.text));
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}
