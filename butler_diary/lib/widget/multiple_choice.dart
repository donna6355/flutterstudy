import 'package:flutter/material.dart';

class MultipleChoice extends StatelessWidget {
  final String choice1;
  final String choice2;
  final String choice3;
  final String choice4;
  final double choiceVal;
  final Function valueState;
  MultipleChoice(this.choice1, this.choice2, this.choice3, this.choice4,
      this.choiceVal, this.valueState);

  String _findImgName(int num) {
    String fileName = '';

    switch (choice1) {
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

    return 'asset/icon/$fileName$num.png';
  }

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
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 54,
                  height: 54,
                  child: Image.asset(_findImgName(0)),
                ),
                // Icon(
                //   Icons.add,
                //   color: choiceVal == 0 ? Color(0xff454442) : Color(0xffB7B6AF),
                // ),
                Text(
                  choice1,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        choiceVal == 0 ? Color(0xff454442) : Color(0xff73726e),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => valueState(choice1, 1.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 54,
                  height: 54,
                  child: Image.asset(_findImgName(1)),
                ),
                // Icon(
                //   Icons.add,
                //   color: choiceVal == 1 ? Color(0xff454442) : Color(0xffB7B6AF),
                // ),
                Text(
                  choice2,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        choiceVal == 1 ? Color(0xff454442) : Color(0xff73726e),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => valueState(choice1, 2.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 54,
                  height: 54,
                  child: Image.asset(_findImgName(2)),
                ),
                // Icon(
                //   Icons.add,
                //   color: choiceVal == 2 ? Color(0xff454442) : Color(0xffB7B6AF),
                // ),
                Text(
                  choice3,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        choiceVal == 2 ? Color(0xff454442) : Color(0xff73726e),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => valueState(choice1, 3.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 54,
                  height: 54,
                  child: Image.asset(_findImgName(3)),
                ),
                // Icon(
                //   Icons.add,
                //   color: choiceVal == 3 ? Color(0xff454442) : Color(0xffB7B6AF),
                // ),
                Text(
                  choice4,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        choiceVal == 3 ? Color(0xff454442) : Color(0xff73726e),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
