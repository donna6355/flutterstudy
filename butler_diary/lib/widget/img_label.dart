import 'package:flutter/material.dart';

class ImgLabel extends StatelessWidget {
  final String label;
  final String choice;
  final double choiceVal;
  final int idx;
  ImgLabel(this.label, this.choice, this.choiceVal, this.idx);

  @override
  Widget build(BuildContext context) {
    String _findImgName() {
      String fileName = '';

      switch (label) {
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

      return 'asset/icon/$fileName$idx.png';
    }

    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: choiceVal == idx
            ? Border.all(color: Color(0xff454442), width: 1)
            : Border.all(color: Color(0xffE5E4DB), width: 1),
        borderRadius: BorderRadius.circular(10),
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
          // Icon(
          //   Icons.add,
          //   color: choiceVal == 1 ? Color(0xff454442) : Color(0xffB7B6AF),
          // ),
          Text(
            choice,
            style: TextStyle(
              fontSize: 13,
              color: choiceVal == idx ? Color(0xff454442) : Color(0xff73726e),
            ),
          ),
        ],
      ),
    );
  }
}
