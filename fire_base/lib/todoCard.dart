import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todoState.dart';

class TodoCard extends StatelessWidget {
  final String task;
  final bool isDone;
  final bool isDeleted;
  final String id;

  TodoCard(this.task, this.isDone, this.isDeleted, this.id);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Provider.of<TodoState>(context, listen: false).doneStatus(id);
              },
              child: Container(
                child: Text(
                  '$task $isDone',
                  style: TextStyle(
                    decoration: isDone
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
              Provider.of<TodoState>(context, listen: false).delete(id);
              print('delete');
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}
