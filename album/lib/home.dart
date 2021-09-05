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
            ElevatedButton(
              onPressed: () => showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Warning'),
                      content: Text('warning warning be careful!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('confirm'),
                        ),
                      ],
                    );
                  }),
              child: Text('press for alert'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: Text('move next page'),
            ),
          ],
        ),
      ),
    );
  }
}
