// https://medium.com/@pinkesh.earth/top-5-flutter-box-widgets-you-should-know-f86d8e02d86b
//ConstrainedBox FittedBox FractionallySizedBox LimitedBox SizedBox

import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {
  const Boxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('ConstrainedBox'),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 50),
          child: const Icon(
            Icons.add,
            size: 80,
            color: Colors.red,
          ),
        ),
        const Text('Fitted Box'),
        const FittedBox(
          child: Text(
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
            maxLines: 1,
            style: TextStyle(fontSize: 23),
          ),
        ),
        const Text('Fractionally Sized Box'),
        FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.1, //useful instead of sizedBox with percentage
          child: Container(
            decoration: const BoxDecoration(color: Colors.greenAccent),
          ),
        ),
        const Text('Limited Box'),
        ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return LimitedBox(
                maxHeight: 50,
                child: Container(
                  color: Colors.greenAccent,
                ),
              );
            }),
        const Text('Sized Box'),
        const SizedBox(height: 50),
      ],
    );
  }
}
