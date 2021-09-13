import 'package:flutter/material.dart';
import './grid.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hey'),
      ),
      body: Grid(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/input');
        },
        child: Icon(Icons.add),
        tooltip: 'Add Items',
      ),
    );
  }
}
