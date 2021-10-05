import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Butler's Diary",
      theme: ThemeData(
        fontFamily: 'GamjaFlower',
        primaryColor: Color(0xffE5E4DB),
        scaffoldBackgroundColor: Color(0xffE5E4DB),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Color(0xff454442),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '집사 다이어리',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Text('냥님1'),
            Text('냥님2'),
            Text('냥님3'),
            Text('이용 안내'),
            Text('개발자 메시지'),
          ],
        ),
      ),
      body: Center(
        child: Text('Text'),
      ),
    );
  }
}
