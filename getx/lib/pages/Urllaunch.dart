// ignore_for_file: file_names, unused_import, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Urllaunch extends StatelessWidget {
  void _launchUrl() async {
    //weird....
    const url = 'https://pub.dev/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _launchUrl();
          },
          child: Text('go to flutter.dev'),
        ),
      ),
    );
  }
}
