// ignore_for_file: use_key_in_widget_constructors, unused_element, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPkg extends StatefulWidget {
  @override
  _WebViewPkgState createState() => _WebViewPkgState();
}

class _WebViewPkgState extends State<WebViewPkg> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              _controller!.loadUrl("https://www.naver.com/");
            },
            child: Text('move to Naver'),
          ),
          ElevatedButton(
            onPressed: () {
              _controller!.loadUrl('https://www.tving.com/en');
            },
            child: Text('move to Tving'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('WebViewPkg'),
      ),
      body: Container(
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
            width: 3,
          ),
        ),
        width: 300,
        height: 300,
        child: WebView(
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
          initialUrl: 'https://flutter.dev',
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains('naver.com')) {
              // do not navigate
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }
}
