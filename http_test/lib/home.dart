import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url =
      'http://openapi.seoul.go.kr:8088/69564e417a746f6536346950725054/json/culturalEventInfo/1/5/';
  var _loading = true;
  var _result;

  _httpGet(String url) async {
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(response.body);
    setState(() {
      _result = data['culturalEventInfo']['row'];
      _loading = false;
    });
    print(_result);
  }

  @override
  void initState() {
    super.initState();
    _httpGet(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('서울특별시 문화행사 정보'),
      ),
      body: Container(
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: _result.length,
                itemBuilder: (BuildContext context, int idx) {
                  return Container(
                    height: 200,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    color: Colors.amber[200],
                    child: Column(
                      children: [
                        Text(
                          _result[idx]['TITLE'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('기간: ${_result[idx]['DATE']}'),
                        Text('장소: ${_result[idx]['PLACE']}'),
                        SizedBox(height: 15),
                        Text(
                          _result[idx]['PROGRAM'],
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
