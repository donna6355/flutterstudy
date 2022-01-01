import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './controller/getxControl.dart';
import './pages/first.dart';
import './pages/second.dart';
import './pages/third.dart';
import './pages/Urllaunch.dart';

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
          name: '/urllaunch',
          page: () => Urllaunch(),
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
                // Navigator.of(context).push
                // Get.to(First());
                Get.toNamed('/urllaunch');
              },
              title: const Text('url launch'),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).push
                // Get.to(First());
                Get.to(First(), arguments: 'I am sendin this');
              },
              title: const Text('first'),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).pushReplacement
                Get.off(
                  Second(),
                  transition: Transition.fadeIn,
                );
                // Navigator.of(context).pushAndRemoveUntil
                // Get.offAll(Third());
              },
              title: const Text('second'),
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
