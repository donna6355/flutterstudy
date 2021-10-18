import 'package:flutter/material.dart';

class ToggleChoice extends StatelessWidget {
  final String choice;
  final bool choiceVal;
  final Function toggleState;

  ToggleChoice(this.choice, this.choiceVal, this.toggleState);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleState(choice),
      child: Container(
        child: Column(children: [
          Icon(
            Icons.add,
            color: choiceVal ? Color(0xff454442) : Color(0xffB7B6AF),
          ),
          Text(
            choice,
            style: TextStyle(
              fontSize: 12,
              color: choiceVal ? Color(0xff454442) : Color(0xff73726e),
            ),
          ),
        ]),
      ),
    );
  }
}
