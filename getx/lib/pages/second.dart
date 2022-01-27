// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/getxControl.dart';

class Second extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  final _widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        // FocusScope.of(context).unfocus(); //same function
      },
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
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('hello', key: _widgetKey),
                          // This getter will only return a valid result after the layout phase is complete.
                          // It is therefore not valid to call this from a build method.
                          // It should only be called from paint callbacks or interaction event handlers (e.g. gesture callbacks).
                          // Text(_widgetKey.currentContext.size!.width.toString()),
                          Container(
                            padding: EdgeInsets.only(
                              right: 5,
                              left: 5,
                              bottom: 10,
                            ),
                            child: const Text('width 100'),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 3,
                                  color: controller.aniWidth == 100
                                      ? Colors.orange
                                      : Color(0x00000000),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              right: 5,
                              left: 5,
                              bottom: 10,
                            ),
                            child: const Text('300'),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 3,
                                  color: controller.aniWidth == 300
                                      ? Colors.orange
                                      : Color(0x00000000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      UnconstrainedBox(
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
                      ),
                      TextButton(
                        onPressed: () {
                          controller.updateOverlayLoader();
                        },
                        child: Text('start Overlay Loader'),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 400,
                            color: Colors.black12,
                            child: const Text('this is for overlay loader'),
                          ),
                          if (controller.overlayLoading)
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black.withOpacity(0.6),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.teal),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
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
