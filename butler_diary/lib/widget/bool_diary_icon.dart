import 'package:flutter/material.dart';

class BoolDiaryIcon extends StatelessWidget {
  final String label;
  BoolDiaryIcon(
    this.label,
  );

  String _findImgName() {
    String fileName = '';

    switch (label) {
      case '츄르':
        fileName = 'chew';
        break;
      case '트릿':
        fileName = 'treat';
        break;
      case '습식':
        fileName = 'can';
        break;
      case '기타':
        fileName = 'other';
        break;
      case '헤어볼':
        fileName = 'hair';
        break;
      case '설사':
        fileName = 'diar';
        break;
      case '토켁켁':
        fileName = 'puke';
        break;
      case '파괴왕':
        fileName = 'dest';
        break;
      case '동물병원':
        fileName = 'vet';
        break;
      case '예방접종':
        fileName = 'vac';
        break;
      case '약':
        fileName = 'pill';
        break;
      case '안약':
        fileName = 'eye';
        break;
      case '사냥놀이':
        fileName = 'hunt';
        break;
      case '치카':
        fileName = 'teeth';
        break;
      case '빗질':
        fileName = 'fur';
        break;
      case '목욕':
        fileName = 'bath';
        break;
      case '발톱깎기':
        fileName = 'claw';
        break;
      case '전체갈이':
        fileName = 'toilet';
        break;
      default:
        break;
    }

    return 'asset/icon/$fileName.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 75,
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
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
