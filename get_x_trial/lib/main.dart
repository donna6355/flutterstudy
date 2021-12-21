import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './pages/first.dart';
import './pages/second.dart';
import './pages/third.dart';

void main() {
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
        )
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
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
            )
          ],
        ),
      ),
    );
  }
}
