import 'package:flutter/material.dart';

import './bool_diary_icon.dart';

class DiaryCardBool extends StatelessWidget {
  const DiaryCardBool({
    required this.label,
    required this.firstLabel,
    required this.firstVal,
    required this.secondLabel,
    required this.secondVal,
    this.thirdLabel,
    this.thirdVal,
    this.fourthLabel,
    this.fourthVal,
    Key? key,
  }) : super(key: key);
  final String label;
  final bool firstVal;
  final String firstLabel;
  final bool secondVal;
  final String secondLabel;
  final bool? thirdVal;
  final String? thirdLabel;
  final bool? fourthVal;
  final String? fourthLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.1)),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            SizedBox(width: 5),
            if (firstVal) BoolDiaryIcon(firstLabel),
            if (secondVal) BoolDiaryIcon(secondLabel),
            if (thirdVal != null && thirdVal == true)
              BoolDiaryIcon(thirdLabel!),
            if (fourthVal != null && fourthVal == true)
              BoolDiaryIcon(fourthLabel!),
          ],
        ),
      ],
    );
  }
}
