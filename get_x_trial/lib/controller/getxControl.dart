// ignore_for_file: file_names, unused_import

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
  var user = User(id: 1, name: 'Isaac').obs;

  get sum => count1.value + count2.value;

  change({required int id, required String name}) {
    //to change custom class obs
    user.update((val) {
      val?.name = name;
      val?.id = id;
    });
  }
}
