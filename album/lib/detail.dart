import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String title;
  Detail(this.title);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detailed Page')),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Image.asset('asset/issac.jpeg'),
            ),
            Text('hello! greetings from Issac:)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
          ],
        ),
      ),
    );
  }
}
// this is for just test