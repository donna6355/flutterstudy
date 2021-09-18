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
                      return ChangeNotifierProvider.value(
                        // create: (context) => todoState.getList[idx],
                        //better approach for nested provider!
                        value: todoState.getList[idx],
                        child: TodoCard(),
                      );
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
