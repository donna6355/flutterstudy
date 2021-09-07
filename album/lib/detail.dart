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
              child: GestureDetector(
                onTap: () => showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Warning'),
                        content: Text(
                            'warning warning be careful! \nHe will bite you!'),
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
                child: Image.asset('asset/issac.jpeg'),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text('Hello!\nGreetings from Issac:)',
                textAlign: TextAlign.center,
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