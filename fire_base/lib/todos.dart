import 'package:flutter/material.dart';
import './todoinput.dart';
import './todoCard.dart';

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
                child: ListView(
              children: <Widget>[
                TodoCard(),
                TodoCard(),
                TodoCard(),
                TodoCard(),
                TodoCard(),
                TodoCard(),
                TodoCard(),
                TodoCard(),
                TodoCard(),
                TodoCard(),
              ],
            )),
            Todoinput(),
          ],
        ));
  }
}
