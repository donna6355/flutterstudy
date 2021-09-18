import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todoState.dart';
import '../class/todo.dart';

class TodoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Consumer<Todo>(
        builder: (context, todo, child) {
          return Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Provider.of<Todo>(context, listen: false).toggleDone();
                  },
                  child: Container(
                    child: Text(
                      todo.todo,
                      style: TextStyle(
                        decoration: todo.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Provider.of<TodoState>(context, listen: false)
                      .delete(todo.id);
                  print('delete');
                },
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          );
        },
      ),
    );
  }
}
