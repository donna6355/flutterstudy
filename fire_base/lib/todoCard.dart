import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                print('tap');
              },
              child: Container(
                child: Text('todo card here'),
                padding: EdgeInsets.only(
                  left: 20,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              print('delete');
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}
