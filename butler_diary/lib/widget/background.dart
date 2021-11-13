import 'package:flutter/material.dart';
import 'dart:math';

class Background extends StatefulWidget {
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  final List<String> commonSense = [
    "캣타워 같은 수직공간이 필요하다옹!",
    "나는 단맛을 느끼지 못한다옹!",
    "내 체온은 38.5도이다옹!",
    "나는 좁은 곳에서 안정감을 느낀다옹!",
    "나는 엄청난 근시다옹!",
    "나는 뛰어난 동체시력을 가지고 있다옹!",
    "방묘창, 방묘문은 기본이다옹!",
    "나도 높은데서 떨어지면 다친다옹!",
    "나는 냄새와 소리에 민감하다옹!",
    "나는 작은 맹수! 육식동물이다옹!",
    "나는 잠꾸러기다옹! 아가들은 20시간도 잔다옹!",
    "나는 꼬리로도 의사소통한다옹!",
    "나도 매년 예방접종이 필요하다옹!",
    "나는 목욕 안 해도 그루밍해서 깨끗하다옹!",
    "나는 고양이 액체설에 걸맞는 유연함을 가지고 있다옹!",
    "나도 집사와 함께 놀고 교감하고 싶다옹!",
    "하루에 최소 25분은 나랑 놀아줘야한다옹!",
    "화장실은 항상 깨끗하게 치워줘야 한다옹!",
    "나는 일년 내내 털을 뿜는다옹!",
    "알맞은 사료와 신선한 물을 준비해 줘야한다옹!",
    "나는 스트레스에 매우 민감하다옹!",
    "나는 영역동물이라 낯선 곳이 싫다옹!",
    "나도 광견병 주사를 맞아야 된다옹!",
    "나도 정기적으로 건강검진을 해야한다옹!",
    "나도 어릴때 이갈이를 한다옹!",
    "초콜릿은 위험하다옹!",
    "나의 애창곡은 골골송이다옹!",
    "나는 귤, 오렌지같은 시트러스 향이 실타옹!",
    "숨숨집과 스크래처는 많을 수록 좋다옹!",
    "나는 1살이 되면 으른이다옹!",
    "나의 평균 수명은 15~20년이다옹!",
  ];

  @override
  Widget build(BuildContext context) {
    final _isPhone = MediaQuery.of(context).size.shortestSide < 550;

    return Positioned(
      right: 25,
      bottom: 10,
      child: Opacity(
        opacity: 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: _isPhone ? 120 : 160,
              height: _isPhone ? 120 : 160,
              child:
                  Image.asset('asset/img/face${new Random().nextInt(8)}.png'),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Text('${commonSense[new Random().nextInt(commonSense.length)]}'),
          ],
        ),
      ),
    );
  }
}
