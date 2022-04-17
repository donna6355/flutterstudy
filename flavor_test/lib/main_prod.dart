import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flavor_test/helpers/localization.dart';
import './flavors.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  Config.appFlavor = Flavor.prod;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Localization(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Flavor Tutorial'),
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
  void initState() {
    super.initState();
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("04927a1e-398c-4976-8286-7b2cc1b0aa37");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared
        .promptUserForPushNotificationPermission(fallbackToSettings: true)
        .then((accepted) {
      print("Accepted permission: $accepted");
    });
  }

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
                  Get.locale == Locale('en')
                      ? Get.updateLocale(Locale('ko'))
                      : Get.updateLocale(Locale('en'));
                },
                child: Text('LANGUAGE'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
