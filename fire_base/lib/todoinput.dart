import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todoState.dart';

class Todoinput extends StatelessWidget {
  final _taskControl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[50],
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: _taskControl,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                labelText: 'What you gotta to do?',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter yout task';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  Provider.of<TodoState>(context, listen: false)
                      .addTodo(_taskControl.text);
                  _taskControl.clear();
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
