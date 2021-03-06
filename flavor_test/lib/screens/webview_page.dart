import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> with WidgetsBindingObserver {
  InAppWebViewController? _webViewController;
  InAppWebViewController? _webViewPopupController;
  late PullToRefreshController _pullToRefreshController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    _pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.amber,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          _webViewController?.reload();
        } else if (Platform.isIOS) {
          _webViewController?.loadUrl(
              urlRequest: URLRequest(url: await _webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      print('app resumed');
    } else if (state == AppLifecycleState.inactive) {
      print('app inactive');
    } else if (state == AppLifecycleState.paused) {
      print('app paused');
    } else if (state == AppLifecycleState.detached) {
      print('app detached');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          pullToRefreshController: _pullToRefreshController,
          onLoadStop: (controller, url) async {
            _pullToRefreshController.endRefreshing();
          },
          onLoadError: (controller, url, code, message) {
            _pullToRefreshController.endRefreshing();
          },
          onProgressChanged: (controller, progress) {
            if (progress == 100) {
              _pullToRefreshController.endRefreshing();
            }
          },
          initialUrlRequest:
              URLRequest(url: Uri.parse("https://inappwebview.dev/")),
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptCanOpenWindowsAutomatically: true,
                javaScriptEnabled: true,
              ),
              android: AndroidInAppWebViewOptions(
                supportMultipleWindows: true,
                useHybridComposition: true,
              ),
              ios: IOSInAppWebViewOptions(
                allowsBackForwardNavigationGestures: true,
              )),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
          onCreateWindow: (controller, createWindowReq) async {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: InAppWebView(
                    windowId: createWindowReq.windowId,
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        userAgent: 'Chrome/81.0.0.0 Mobile',
                      ),
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      _webViewPopupController = controller;
                    },
                  ),
                );
              },
            );
            return true;
          },
        ),
      ),
    );
  }
}
