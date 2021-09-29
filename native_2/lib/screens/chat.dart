import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, idx) => Container(
          child: Text('works'),
          padding: EdgeInsets.all(8),
        ),
      ),
    );
  }
}
