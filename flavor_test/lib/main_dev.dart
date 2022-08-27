import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flavor_test/helpers/localization.dart';
import './flavors.dart';
import 'package:flavor_test/screens/webview_page.dart';

void main() {
  Config.appFlavor = Flavor.dev;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Localization(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WebviewPage(),
      // home: const MyHomePage(title: 'Flutter Flavor Tutorial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'This is ${Config.title}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text('GREETING'.tr),
              TextButton(
                onPressed: () {
                  Get.deviceLocale == const Locale('en')
                      ? Get.updateLocale(const Locale('ko'))
                      : Get.updateLocale(const Locale('en'));
                },
                child: Text('LANGUAGE'.tr),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(WebviewPage());
                  },
                  child: const Text('to InappView')),
            ],
          ),
        ),
      ),
    );
  }
}
