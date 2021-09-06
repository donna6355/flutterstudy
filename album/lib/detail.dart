import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String title;
  Detail(this.title);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detailed Page')),
      body: Center(
        child: Text('hello! greetings from details'),
      ),
    );
  }
}
// this is for just test