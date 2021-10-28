import 'package:flutter/material.dart';
import './img_label.dart';

class MultipleChoice extends StatelessWidget {
  final String choice1;
  final String choice2;
  final String choice3;
  final String choice4;
  final double choiceVal;
  final Function valueState;
  MultipleChoice(this.choice1, this.choice2, this.choice3, this.choice4,
      this.choiceVal, this.valueState);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => valueState(choice1, 0.0),
            child: ImgLabel(choice1, choice1, choiceVal, 0),
          ),
          GestureDetector(
            onTap: () => valueState(choice1, 1.0),
            child: ImgLabel(choice1, choice2, choiceVal, 1),
          ),
          GestureDetector(
            onTap: () => valueState(choice1, 2.0),
            child: ImgLabel(choice1, choice3, choiceVal, 2),
          ),
          GestureDetector(
            onTap: () => valueState(choice1, 3.0),
            child: ImgLabel(choice1, choice4, choiceVal, 3),
          ),
        ],
      ),
    );
  }
}
