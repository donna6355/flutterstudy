// ignore_for_file: use_key_in_widget_constructors, unused_element, file_names

import 'package:flutter/material.dart';
import "package:url_launcher/url_launcher.dart";

class WebView extends StatelessWidget {
  void _launchUrl(String str) async {
    //weird....
    String url = str.trim();
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true, // to open this link in webview
        forceWebView: true,
        enableJavaScript: true,
      );
      await Future.delayed(Duration(seconds: 3));

      await closeWebView();
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
          onPressed: () {
            _launchUrl('https://donna6355.github.io/myportfolio/');
          },
          child: const Text(
            'webView',
            style: TextStyle(
              fontSize: 30,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          )),
    ));
  }
}
