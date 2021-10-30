import 'package:flutter/material.dart';

class MultiDiaryIcon extends StatelessWidget {
  final double value;
  final String label1;
  final String label2;
  final String label3;
  final String label4;

  MultiDiaryIcon(
      this.value, this.label1, this.label2, this.label3, this.label4);

  String _findImgName() {
    String fileName = '';

    switch (label1) {
      case '뭘보냥':
        fileName = 'feel';
        break;
      case '습식 실타냥':
        fileName = 'wetf';
        break;
      case '건식 실타냥':
        fileName = 'dryf';
        break;
      case '물 실타냥':
        fileName = 'water';
        break;
      case '변비냥':
        fileName = 'poo';
        break;
      case '으잉?':
        fileName = 'pee';
        break;
      default:
        break;
    }

    return 'asset/icon/$fileName${value.toInt()}.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 70,
      margin: EdgeInsets.only(
        right: 5,
        bottom: 5,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: 54,
            height: 54,
            child: Image.asset(_findImgName()),
          ),
          // Icon(Icons.add),
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
