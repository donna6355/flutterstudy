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
  int stage = 0; //default 0, success 1, fail 2;

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
          if (stage == 0)
            ElevatedButton(
              onPressed: () {
                _controller!.loadUrl("https://www.naver.com/");
              },
              child: const Text('move to Naver'),
            ),
          if (stage == 0)
            ElevatedButton(
              onPressed: () {
                _controller!.loadUrl('https://www.tving.com/en');
              },
              child: const Text('move to Tving'),
            ),
        ],
      ),
      appBar: AppBar(
        title: const Text('WebViewPkg'),
      ),
      body: Container(
        margin: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
            width: 3,
          ),
        ),
        width: 300,
        height: 300,
        child: stage == 0
            ? WebView(
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                },
                initialUrl: 'https://flutter.dev',
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: (NavigationRequest request) {
                  if (request.url.contains('naver.com')) {
                    // do not navigate
                    setState(() {
                      stage = 1;
                    });
                    return NavigationDecision.prevent;
                  }

                  return NavigationDecision.navigate;
                },
              )
            : Container(
                color: Colors.amber,
                child: const Text('reach to Naver'),
              ),
      ),
    );
  }
}
