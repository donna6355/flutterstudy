import 'package:flutter/material.dart';

class ToggleChoice extends StatelessWidget {
  final String choice;
  final bool choiceVal;
  ToggleChoice(this.choice, this.choiceVal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Icon(
          Icons.add,
          color: choiceVal ? Color(0xff454442) : Color(0xffB7B6AF),
        ),
        Text(
          choice,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ]),
    );
  }
}
