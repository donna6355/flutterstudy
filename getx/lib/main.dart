// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
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
                    title: 'warning', middleText: 'I am testing dialog here!');
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
                          children: [
                            const Text('custom dialog'),
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
                return Text('double : ${Get.find<ReactiveCont>().double}');
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
    );
  }
}
