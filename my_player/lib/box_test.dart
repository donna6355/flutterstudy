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
      ],
    );
  }
}
