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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
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
