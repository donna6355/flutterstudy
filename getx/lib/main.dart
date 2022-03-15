// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './controller/getxControl.dart';
import './pages/first.dart';
import './pages/second.dart';
import './pages/third.dart';
import './pages/Urllaunch.dart';
import './pages/infinite.dart';
import './pages/infiniteCtrl.dart';
import './pages/webView.dart';
import './pages/webViewPkg.dart';
import './pages/layout.dart';
import 'pages/tabTest.dart';
import 'pages/stepperTest.dart';
import 'pages/customAppBar.dart';
import 'pages/heroTrial.dart';
import 'pages/subList.dart';
import 'pages/customSwitch.dart';
import './controller/myRouteObserver.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [MyRouteObserver()],
      getPages: [
        GetPage(
          name: '/third/:greeting',
          page: () => Third(),
        ),
        GetPage(
          name: '/infinite',
          page: () => Infinite(),
        ),
        GetPage(
          name: '/urllaunch',
          page: () => Urllaunch(),
        ),
        GetPage(
          name: '/webView',
          page: () => WebView(),
        ),
        GetPage(
          name: '/layout',
          page: () => Layout(),
        ),
        GetPage(
          name: '/infiniteCtrl',
          page: () => InfiniteCtrl(),
        )
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final box = GetStorage();
  //how to get system lang preference. import dart:io
  final String defaultLocale =
      Platform.localeName; // Returns locale string in the form 'en_US'

  final String os = Platform.operatingSystem;
  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    final reactiveCont = Get.put(ReactiveCont());

    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        endDrawer: Drawer(
          child: Center(
            child: Text("This is Isaac's Home"),
          ),
        ),
        endDrawerEnableOpenDragGesture: true,
        drawer: Drawer(
          child: Center(child: Text('FROM LEFT')),
        ),
        drawerEnableOpenDragGesture: false, //false to disable
        //generally wrap a body of scaffold
        body: SafeArea(
          child: Center(
            child: Scrollbar(
              // isAlwaysShown: true, //deprecated
              thumbVisibility: true,
              child: ListView(
                children: [
                  ListTile(
                    title: CustomSwitch(),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(SubList());
                    },
                    title: Text('SubList Trial!'),
                  ),

                  ListTile(
                    onTap: () {
                      Get.to(HeroTrial());
                    },
                    title: Row(
                      children: [
                        Hero(
                          tag: 'trial',
                          child: ClipOval(
                            child: Image.asset(
                              'img/issac.jpeg',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('Hero trial!'),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: 'Greetings from Flutter App'),
                      );
                      // it may not work properly in android simulator!
                      Get.snackbar(
                        'GetX',
                        'Greeting copied to clipboarad',
                        backgroundColor: Colors.black87,
                        colorText: Colors.white,
                      );
                    },
                    title: Text('copy to clipboard'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(CustomAppBar());
                    },
                    title: Text('Sliver AppBar'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(StepperTest());
                    },
                    title: Text('Stepper test'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(TabTest());
                    },
                    title: Text('Tab Test'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(WebViewPkg());
                    },
                    title: Text('loca_lang: $defaultLocale / os: $os'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/layout');
                    },
                    title: const Text('Layout builder n animation'),
                  ),
                  ListTile(
                    onTap: () {
                      // Navigator.of(context).push
                      // Get.to(First());
                      Get.toNamed('/webView');
                    },
                    title: const Text('WebView'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/urllaunch');
                    },
                    title: const Text('url launch'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(First(), arguments: 'I am sendin this');
                    },
                    title: const Text('PageView'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/infinite');
                    },
                    title: const Text('infinite scroll'),
                  ),
                  ListTile(
                    onTap: () {
                      controller.addScrollListner();
                      controller.mockfecth();
                      Get.toNamed('/infiniteCtrl');
                    },
                    title: const Text('FAILED infinite Control scroll'),
                  ),
                  ListTile(
                    onTap: () {
                      // Navigator.of(context).pushReplacement
                      Get.to(
                        Second(),
                        transition: Transition.fadeIn,
                      );
                      // Navigator.of(context).pushAndRemoveUntil
                      // Get.offAll(Third());
                    },
                    title: const Text('Animation Page'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/third/oops?date=dec21');
                    },
                    title: const Text('third'),
                  ),
                  ListTile(
                    onTap: () {
                      // Navigator.of(context).canPop()?
                      // Navigator.of(context).pop():
                      // null;
                      // Get.back(result:$var); argument receive
                      Get.back();
                    },
                    title: const Text('back'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.defaultDialog(
                          title: 'warning',
                          middleText: 'I am testing dialog here!');
                    },
                    title: const Text('dialog'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.dialog(
                        Container(
                          margin: const EdgeInsets.all(50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: double.infinity,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Column(
                                children: const [
                                  Text('custom dialog'),
                                  Text('sample 1'),
                                  Text('sample 2'),
                                  Text('sample 3'),
                                  Text('sample 4'),
                                  Text('sample 5'),
                                ],
                              ),
                              Positioned(
                                right: -10,
                                child: TextButton.icon(
                                  label: Text(''),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    title: const Text('custom dialog'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.snackbar('title', 'snackbar msg from top');
                    },
                    title: const Text('snackbar'),
                  ),
                  ListTile(
                    onTap: () {
                      controller.increment();
                    },
                    title: GetBuilder<Controller>(
                      // init: Controller(), // no need if controller called above with Get.put();
                      builder: (_) {
                        return Text('State Update Num : ${_.num}');
                      },
                    ),
                  ),
                  GetBuilder<Controller>(
                    builder: (_) {
                      return _.num % 2 == 0
                          ? Container(
                              color: Colors.amber,
                              height: 20,
                            )
                          : Container(
                              color: Colors.blue,
                              height: 20,
                            );
                    },
                  ),
                  ListTile(
                    onTap: () {
                      Get.find<ReactiveCont>().count1++;
                    },
                    title: GetX<ReactiveCont>(
                      init: ReactiveCont(),
                      builder: (_) {
                        return Text('obs count1 : ${_.count1.value}');
                      },
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.find<ReactiveCont>().count2++;
                    },
                    title: Obx(
                      () {
                        //obx to only return the value of its variable;
                        return Text(
                            'Obx count2 : ${Get.find<ReactiveCont>().count2.value}');
                      },
                    ),
                  ),
                  ListTile(
                    title: Obx(() {
                      return Text('sum : ${Get.find<ReactiveCont>().sum}');
                    }),
                  ),
                  ListTile(
                    onTap: () {
                      Get.find<ReactiveCont>().change(id: 2, name: 'Hello');
                    },
                    title: Obx(() {
                      // value only for primitive. list n map dont need value;
                      return Text(
                          'custom class USER : ${Get.find<ReactiveCont>().user.value.id}/${Get.find<ReactiveCont>().user.value.name}');
                    }),
                  ),
                  const ListTile(
                    title: Text('try list'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.find<ReactiveCont>().mode.value =
                          Get.find<ReactiveCont>().mode.value == 'original'
                              ? 'reverse'
                              : 'original';
                    },
                    title: const Text('change list mode'),
                  ),
                  ListTile(
                    title: Obx(() {
                      return Text(
                          'Selected Mode : ${Get.find<ReactiveCont>().mode.value}');
                    }),
                  ),
                  Container(
                    width: double.infinity,
                    color: reactiveCont.mode.value == 'original'
                        ? Colors.amber
                        : Colors.blue,
                    height: 50,
                  ),
                  ListTile(
                    title: Obx(() {
                      return Text(
                          '${Get.find<ReactiveCont>().mode.value} : ${Get.find<ReactiveCont>().mode.value == 'original' ? Get.find<ReactiveCont>().sample : Get.find<ReactiveCont>().reverse}');
                    }),
                  ),
                  ListTile(
                    title: Obx(() {
                      return Text(
                          'double : ${Get.find<ReactiveCont>().double}');
                    }),
                  ),
                  ListTile(
                    onTap: () {
                      Get.find<ReactiveCont>().sort();
                    },
                    title: const Text('sort ascending'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.find<ReactiveCont>().sortDescend();
                    },
                    title: const Text('sort descending'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.find<ReactiveCont>().shuffle();
                    },
                    title: const Text('shuffle'),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.green,
                    height: 50,
                  ),
                  const ListTile(
                    title: Text('getX Storage from here'),
                  ),
                  ListTile(
                      title: const Text('click to Write'),
                      onTap: () {
                        box.write('try', 'GetX Write Test');
                      }),
                  box.read('try') == null
                      ? const ListTile(
                          title: Text('nothing yet'),
                        )
                      : ListTile(
                          title: Text(
                            box.read('try'),
                          ),
                        )
                  // ListTile(
                  //   title: Obx(() {
                  //     return Text('reverse : ${Get.find<ReactiveCont>().reverse}');
                  //   }),
                  // ),
                  // ListTile(
                  //   title: Obx(() {
                  //     return Text('even : ${Get.find<ReactiveCont>().even}');
                  //   }),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    // https://flutteragency.com/how-to-programmatically-exist-the-app-in-flutter/
    // 1. Navigator.of(context).pop(true)
    // 2. SystemNavigator.pop() // 앱 종료 import 'package:flutter/services.dart';
    // 3. exit(0) //강제종료
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Do you want to exit?"),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // print('yes selected');
                            Navigator.of(context).pop(true);
                            // SystemNavigator.pop();
                            // exit(0);
                          },
                          child: Text("Yes"),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.amber),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          // print('no selected');
                          Navigator.of(context).pop();
                        },
                        child:
                            Text("No", style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}


//flutter create . 
////flutter config --enable-web 
/////flutter run -d chrome 
/////checklayout 
/////check library's web support 
/////check navigation 
/////scrollbar, mouse,keyboard interaction check 
/////rendering mode : html, canvaskit **default : auto;
//flutter build web


//mediaQuery caviet
//when keyboard appears mediaQuery value changes n rebuild the whole widget!
//use layoutBuilder or double.infinity etc to avoid repainting widget with media query!


// Solution Turns out if the hardware keyboard is connected, it will suppress the software keyboard. 
// cmd + shift + k disconnects the hardware keyboard or cmd + k toggles the software keyboard.

// https://stackoverflow.com/questions/7852566/error-error-installing-ffi-error-failed-to-build-gem-native-extension
// error installing ffi

// Could not build the precompiled application for the device.

// It appears that your application still contains the default signing identifier.
// Try replacing 'com.example' with your signing id in Xcode:
//   open ios/Runner.xcworkspace

// Error launching application on Donna’s iPhone.
// generally bundle identifier is not unique. change it to something else.
// https://karzin.tistory.com/208

// Settings > General > Device Management > select the profile to trust
// https://developer.apple.com/forums/thread/660288

// flutter code convention
// https://medium.com/nonstopio/flutter-best-practices-c3db1c3cd694