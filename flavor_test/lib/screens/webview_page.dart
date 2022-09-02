import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
// class _WebviewPageState extends State<WebviewPage> with WidgetsBindingObserver {
  InAppWebViewController? _webViewController;
  InAppWebViewController? _webViewPopupController;
  late PullToRefreshController _pullToRefreshController;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);

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
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //   if (state == AppLifecycleState.resumed) {
  //     print('app resumed');
  // once app is resumed.. call the webview url again?
  // if (Platform.isAndroid) {
  //     _webViewController?.reload();
  //   } else if (Platform.isIOS) {
  //     _webViewController?.loadUrl(
  //         urlRequest: URLRequest(url: await _webViewController?.getUrl()));
  //   }
  //   } else if (state == AppLifecycleState.inactive) {
  //     print('app inactive');
  //   } else if (state == AppLifecycleState.paused) {
  //     print('app paused');
  //   } else if (state == AppLifecycleState.detached) {
  //     print('app detached');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
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
                setState(() {
                  _progress = progress / 100;
                });
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
            _progress < 1.0
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black45,
                    child: Center(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          SizedBox(
                              width: 100,
                              height: 100,
                              child:
                                  CircularProgressIndicator(value: _progress)),
                          Text(
                            '${_progress * 100.round()}%',
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ))
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
