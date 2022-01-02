// ignore_for_file: file_names, unused_import, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

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
        'Happy New Year\n Seasons Greeting\n https://www.youtube.com/watch?v=hXgMMo8p1ig';
    // List<dynamic> result = string.split('\n');

    List<String> result = string.split('\n');
    List<Widget> widgets = [];
    for (final str in result) {
      if (str.contains('http')) {
        widgets.add(
          GestureDetector(
            onTap: () {
              _launchUrl(str);
            },
            child: Text(
              str.trim(),
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
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
            Column(
              children: _stringToText(),
              crossAxisAlignment: CrossAxisAlignment.start,
            )
          ],
        ),
      ),
    );
  }
}
