import 'package:flutter/material.dart';

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
              hintText: 'What you gotta to do?',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}
