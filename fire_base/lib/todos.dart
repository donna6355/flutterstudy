import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './todoinput.dart';
import './todoCard.dart';
import '../provider/todoState.dart';

class Todos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<TodoState>(
                builder: (context, todoState, child) {
                  return ListView.builder(
                    itemBuilder: (context, idx) {
                      final items = todoState.getList[idx];
                      return TodoCard(
                          items.todo, items.isDeleted, items.isDone, items.id);
                    },
                    itemCount: todoState.getList.length,
                  );
                },
              ),
            ),
            Todoinput(),
          ],
        ));
  }
}
