import 'package:flavor_test/screens/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flavor_test/helpers/localization.dart';
import './flavors.dart';
import './screens/drag_drop.dart';
import './screens/re_order_able.dart';
import './screens/chart_page.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flavor_test/screens/webview_page.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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
      // builder: (ctx, child) {
      //   return Stack(
      //     children: [
      //       child!,
      //       Positioned(
      //         child: Container(
      //           color: Colors.amber,
      //           child: Text("Hello"),
      //         ),
      //       ),
      //     ],
      //   );
      // },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LineChartScreen(),
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
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = <TargetFocus>[];

  GlobalKey keyButton1 = GlobalKey();
  GlobalKey keyButton2 = GlobalKey();
  GlobalKey keyButton3 = GlobalKey();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, showTutorial);

    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("04927a1e-398c-4976-8286-7b2cc1b0aa37");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared
        .promptUserForPushNotificationPermission(fallbackToSettings: true)
        .then((accepted) {
      // print("Accepted permission: $accepted");
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
                key: keyButton1,
              ),
              Text('GREETING'.tr),
              TextButton(
                onPressed: () {
                  Get.locale == const Locale('en')
                      ? Get.updateLocale(const Locale('ko'))
                      : Get.updateLocale(const Locale('en'));
                },
                child: Text('LANGUAGE'.tr),
                key: keyButton2,
              ),
              TextButton(
                onPressed: () {
                  Get.to(WebviewPage());
                },
                child: const Text('to InappView'),
                key: keyButton3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showTutorial() {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
      },
    )..show();
  }

  void initTargets() {
    targets.clear();
    targets.add(
      TargetFocus(
        identify: "keyButton",
        keyTarget: keyButton1,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Titulo lorem ipsum",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "keyButton",
        keyTarget: keyButton2,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Titulo lorem ipsum",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "keyButton",
        keyTarget: keyButton3,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Titulo lorem ipsum",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
