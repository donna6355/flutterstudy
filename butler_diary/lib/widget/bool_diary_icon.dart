import 'package:flutter/material.dart';

class BoolDiaryIcon extends StatelessWidget {
  final String label;
  BoolDiaryIcon(
    this.label,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 50,
      margin: EdgeInsets.only(right: 5),
      child: Column(
        children: [
          Icon(Icons.add),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
