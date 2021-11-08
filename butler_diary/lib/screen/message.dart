import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('개발자 메시지'),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 150),
            child: Text(
              '''
어플 기획의 아이디어를 주신 김미르님께 
다양한 포즈를 취해주신 김미르님께 
힘들 때마다 애교를 부려주신 김미르님께 
감사인사를 전합니다. 

아픈 티를 내지 않는 주인님...
먹고 싸고 놀고.. 
이것 저것 꼼꼼히 기록하다보면 주인님의 이상 신호를 더 일찍 알아챌 수 있지 않을까요? 

세상 모든 주인님과 집사님의 건강하고 화목한 일상을 기원합니다.
              ''',
              style: TextStyle(fontSize: 18, height: 2),
            ),
          ),
          Positioned(
            width: 250,
            height: 250,
            right: 0,
            bottom: -30,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset('asset/img/msg.png'),
            ),
          ),
        ],
      ),
    );
  }
}
