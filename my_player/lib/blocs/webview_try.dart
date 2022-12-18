import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await InAppWebViewController.
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late WebMessagePort portToJs;
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("JavaScript Handlers")),
          body: SafeArea(
              child: Column(children: <Widget>[
            InAppWebView(
              onWebViewCreated: (controller) async {
                webViewController = controller;
                var hm = await controller.getOptions();
                print(hm?.crossPlatform.userAgent);
              },
              onConsoleMessage: (controller, consoleMessage) {
                print(
                    "Message coming from the Dart side: ${consoleMessage.message}");
              },
              onLoadStop: (controller, url) async {
                if (await AndroidWebViewFeature.isFeatureSupported(
                    AndroidWebViewFeature.CREATE_WEB_MESSAGE_CHANNEL)) {
                  // wait until the page is loaded, and then create the Web Message Channel
                  var webMessageChannel =
                      await controller.createWebMessageChannel();
                  portToJs = webMessageChannel!.port1;
                  var port2 = webMessageChannel.port2;

                  // set the web message callback for the port1
                  await portToJs.setWebMessageCallback((message) async {
                    print("Message coming from the JavaScript side: $message");
                    await portToJs
                        .postMessage(WebMessage(data: message! + " and back"));
                  });

                  // transfer port2 to the webpage to initialize the communication
                  await controller.postWebMessage(
                    message: WebMessage(data: "capturePort", ports: [port2]),
                  );
                }
              },
            ),
          ]))),
    );
  }
}
