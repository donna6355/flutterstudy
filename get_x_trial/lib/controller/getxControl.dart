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

class ReactiveCont extends GetxController {
  // observable takes more memory
  RxInt count1 = 0.obs;
  var count2 = 0.obs;
}
