import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class DevMessage extends StatelessWidget {
  void _sendEmail(context) async {
    final Email email = Email(
      body: '자유롭게 개발자에게 하고 싶은 말을 적어주면 된다옹:)',
      subject: '[집사 일기] 개발자에게',
      recipients: ['donnajun1214@gmail.com'],
      attachmentPaths: [],
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email);
    } catch (err) {
      showDialog<void>(
          context: context,
          barrierDismissible: true, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('메일 보내기 실패'),
              content: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ListBody(
                  children: const <Widget>[
                    Text('기본 메일 앱을 사용할 수 없어 바로 문의를 전송하기 어려운 상황이다옹!'),
                    Text('아래 이메일로 연락주면 친절하게 답변해 주겠다옹!'),
                    SizedBox(height: 15),
                    Text('donnajun1214@gmail.com'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('확인'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('개발자 메시지'),
        actions: [
          TextButton(
            onPressed: () {
              _sendEmail(context);
            },
            child: const Text('메일 보내기'),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 150),
            child: const Text(
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
