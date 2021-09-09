// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() async {
//   String key = '69564e417a746f6536346950725054';
//   String url =
//       'http://openapi.seoul.go.kr:8088/${key}/json/culturalEventInfo/1/5/';
//   var response = await http.get(Uri.parse(url));

//   Map<String, dynamic> data = jsonDecode(response.body);
//   print(data);
// }

import 'package:flutter/material.dart';
import './home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
