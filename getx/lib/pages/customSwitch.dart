// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _switchVal = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 35,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black12,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _switchVal = !_switchVal;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 40,
            height: 20,
            alignment: _switchVal
                ? AlignmentDirectional.centerStart
                : AlignmentDirectional.centerEnd,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: AnimatedContainer(
              padding: const EdgeInsets.all(3),
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: _switchVal
                    ? const Color(0xffa0aec0)
                    : const Color(0xfff56565),
              ),
              child: const Text('19',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
