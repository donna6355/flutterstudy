// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/getxControl.dart';

class Second extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            //listview will expand children in width. gotta wrap it in UnconstrainedBox
            children: [
              const SizedBox(
                height: 100,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'here'),
              ),
              const SizedBox(
                height: 10,
              ),
              UnconstrainedBox(
                child: ElevatedButton(
                  onPressed: () {
                    controller.activateAni();
                  },
                  child: const Text('Activate'),
                ),
              ),
              GetBuilder<Controller>(
                builder: (_) {
                  return UnconstrainedBox(
                    child: AnimatedContainer(
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
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
