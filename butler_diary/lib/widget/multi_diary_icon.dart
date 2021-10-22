import 'package:flutter/material.dart';

class MultiDiaryIcon extends StatelessWidget {
  final double value;
  final String label1;
  final String label2;
  final String label3;
  final String label4;
  final String keyword;

  MultiDiaryIcon(this.value, this.keyword, this.label1, this.label2,
      this.label3, this.label4);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 50,
      margin: EdgeInsets.only(right: 5),
      child: Column(
        children: [
          Icon(Icons.add),
          if (value == 0)
            Text(
              label1,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          if (value == 1)
            Text(
              label2,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          if (value == 2)
            Text(
              label3,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          if (value == 3)
            Text(
              label4,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }
}
