// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'named parameter : ${Get.parameters['greeting']}; date : ${Get.parameters['date']}'),
      ),
    );
  }
}
