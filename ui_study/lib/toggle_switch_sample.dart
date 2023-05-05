import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Basic toggle switch:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ToggleSwitch(
          initialLabelIndex: 0,
          totalSwitches: 3,
          labels: ['America', 'Canada', 'Mexico'],
          onToggle: (index) {
            print('switched to: $index');
          },
        ),
      ],
    );
  }
}
