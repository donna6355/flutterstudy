// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class First extends StatelessWidget {
  final PageController _pgCtrl = PageController(
    initialPage: 0,
    keepPage: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pgCtrl,
        children: [
          SizedBox.expand(
            child: Container(
              color: Colors.amber,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Page index : ${Get.arguments}1',
                      style: const TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _pgCtrl.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: const Text('to Next Page'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.pink,
              child: Center(
                child: Text(
                  'Page index : ${Get.arguments}2',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.brown,
              child: Center(
                child: Text(
                  'Page index : ${Get.arguments}3',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
