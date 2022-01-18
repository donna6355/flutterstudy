// ignore_for_file: file_names, unused_import, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getx/pages/inputField.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import './inputField.dart';

class Urllaunch extends StatelessWidget {
  void _launchUrl(String str) async {
    //weird....
    String url = str.isEmpty ? 'https://pub.dev/' : str.trim();
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false, // to open this link not in webview
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget generateWg(String str) {
    if (str.contains('http')) {
      return TextButton(
          onPressed: () {
            _launchUrl(str);
          },
          child: Text(str.trim()));
    } else {
      return Text(str.trim());
    }
  }

  List<Widget> _stringToText() {
    const String string =
        'Happy New Year\n Seasons Greeting\n 유튜브 : https://www.youtube.com/watch?v=hXgMMo8p1ig\nhttps://www.youtube.com/watch?v=UPd156gXanU';
    // List<dynamic> result = string.split('\n');

    List<String> result = string.split('\n');
    List<Widget> widgets = [];
    for (final str in result) {
      if (str.contains('http')) {
        int idx = str.indexOf('http');
        String str1 = str.substring(0, idx);
        String str2 = str.substring(idx);
        widgets.add(
          Row(
            children: [
              Text(str1),
              Flexible(
                //need flexible for row to know it shrinkable!
                child: GestureDetector(
                  onTap: () {
                    _launchUrl(str2);
                  },
                  child: Text(
                    str2.trim(),
                    style: TextStyle(
                      color: Colors.amber,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        widgets.add(Text(str.trim()));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            InputField(),
            ElevatedButton(
              onPressed: () {
                _launchUrl('');
              },
              child: Text('go to flutter.dev'),
            ),
            ElevatedButton(
              onPressed: () {
                _stringToText();
              },
              child: Text('str to widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/third/HappyNewYear?date=Jan1');
              },
              child: Text('go to third'),
            ),
            Container(
              color: Colors.blueGrey,
              width: 200,
              child: Column(
                children: _stringToText(),
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}
