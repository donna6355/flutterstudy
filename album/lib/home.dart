import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String appBar;
  final String title;
  Home(this.appBar, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBar),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 240,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // CircularProgressIndicator(),
            // LinearProgressIndicator()
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/detail');
                // Navigator.pushNamed(context, '/detail'); //same syntax
              },
              child: Text('Greetings'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/args', arguments: 'args test');
                // Navigator.pushNamed(context, '/detail'); //same syntax
              },
              child: Text('move Args page'),
            ),
          ],
        ),
      ),
    );
  }
}
