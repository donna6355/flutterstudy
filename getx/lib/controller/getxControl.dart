// ignore_for_file: file_names, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  int num = 0;

  increment() {
    num++;
    update();
  }
}

class User {
  int id = 0;
  String name = 'Annonymous';

  User({required this.id, required this.name});
}

class ReactiveCont extends GetxController {
  // observable takes more memory
  RxInt count1 = 0.obs;
  var count2 = 0.obs;
  var mode = 'original'.obs;
  var user = User(id: 1, name: 'Isaac').obs;
  var sample = [1, 2, 3, 4, 5, 6, 7, 8].obs;

  @override
  void onInit() {
    super.onInit();
    //every time
    ever(count1, (_) {
      print('ever ever');
    });

    //one time only
    once(count1, (_) {
      print('once');
    });

    //delayed
    debounce(
      count1,
      (_) {
        print('debounce');
      },
      time: const Duration(
        seconds: 10,
      ),
    );
  }

  get reverse => sample.reversed.toList();
  // get reverse => sample
  //   ..reversed
  //   ..toList(); //weird doesnt work casecade operator;;
  get even => sample.where((i) => i % 2 == 0).toList();
  get sum => count1.value + count2.value;

  change({required int id, required String name}) {
    //to change custom class obs
    user.update((val) {
      val?.name = name;
      val?.id = id;
    });
  }
}
