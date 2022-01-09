// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/getxControl.dart';

class Second extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                controller.activateAni();
              },
              child: const Text('Activate'),
            ),
            GetBuilder<Controller>(
              builder: (_) {
                return AnimatedContainer(
                  color: Colors.blueGrey,
                  duration: const Duration(milliseconds: 400),
                  width: controller.aniWidth,
                  height: controller.aniHeight,
                  child: const Center(
                    child: Text(
                      'Animation',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
