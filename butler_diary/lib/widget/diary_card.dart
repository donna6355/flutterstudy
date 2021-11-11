import 'package:flutter/material.dart';
import 'dart:io';
import '../model/diary.dart';
import './multi_diary_icon.dart';
import './bool_diary_icon.dart';

class DiaryCard extends StatelessWidget {
  final Diary dailyData;
  final String boxKey;
  final String masterName;
  DiaryCard(this.dailyData, this.boxKey, this.masterName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Image.asset(
                      'asset/icon/done.png',
                      width: 35,
                      height: 35,
                    ),
                    Text(
                      '${dailyData.date.substring(0, 4)}년 ${dailyData.date.substring(5, 7)}월 ${dailyData.date.substring(8, 10)}일 ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    final Map<String, dynamic> args = {
                      'master': masterName,
                      'key': boxKey,
                      'date': dailyData.date,
                    };
                    Navigator.of(context).pushNamed(
                      '/diary_edit',
                      arguments: args,
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.edit),
                      Text(
                        '수정하기',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                if (dailyData.feel != -1)
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.1,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('컨디션'),
                          SizedBox(width: 5),
                          MultiDiaryIcon(
                              dailyData.feel, '뭘보냥', '나쁘냥', '구냥', '죠타냥'),
                        ],
                      ),
                    ],
                  ),
                if (dailyData.dryFood != -1 ||
                    dailyData.wetFood != -1 ||
                    dailyData.water != -1)
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.1,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('드신것'),
                          SizedBox(width: 5),
                          if (dailyData.wetFood != -1)
                            MultiDiaryIcon(dailyData.wetFood, '습식 실타냥',
                                '습식 쪼오금', '습식 적당히', '습식 왕창!'),
                          if (dailyData.dryFood != -1)
                            MultiDiaryIcon(dailyData.dryFood, '건식 실타냥',
                                '건식 쪼오금', '건식 적당히', '건식 왕창!'),
                          if (dailyData.water != -1)
                            MultiDiaryIcon(dailyData.water, '물 실타냥', '사알짝 할짝',
                                '하알짝 할짝', '물먹는 하마'),
                        ],
                      ),
                    ],
                  ),
                if (dailyData.waterySnack ||
                    dailyData.drySnack ||
                    dailyData.snack ||
                    dailyData.otherSnack)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dailyData.dryFood == -1 &&
                              dailyData.wetFood == -1 &&
                              dailyData.water == -1
                          ? Text('드신것')
                          : SizedBox(width: 39),
                      SizedBox(width: 5),
                      if (dailyData.waterySnack) BoolDiaryIcon('츄르'),
                      if (dailyData.drySnack) BoolDiaryIcon('트릿'),
                      if (dailyData.snack) BoolDiaryIcon('습식'),
                      if (dailyData.otherSnack) BoolDiaryIcon('기타'),
                    ],
                  ),
                if (dailyData.poo != -1 || dailyData.pee != -1)
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.1,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('싸신것'),
                          SizedBox(width: 5),
                          if (dailyData.poo != -1)
                            MultiDiaryIcon(
                                dailyData.poo, '변비냥', '반토막', '한토막', '한움큼'),
                          if (dailyData.pee != -1)
                            MultiDiaryIcon(
                                dailyData.pee, '으잉?', '알감자', '감자', '왕감자'),
                        ],
                      ),
                    ],
                  ),
                if (dailyData.hairBall ||
                    dailyData.diarrhea ||
                    dailyData.vomit ||
                    dailyData.destroy)
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.1,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('주의!!'),
                          SizedBox(width: 6),
                          if (dailyData.hairBall) BoolDiaryIcon('헤어볼'),
                          if (dailyData.diarrhea) BoolDiaryIcon('설사'),
                          if (dailyData.vomit) BoolDiaryIcon('토켁켁'),
                          if (dailyData.destroy) BoolDiaryIcon('파괴왕'),
                        ],
                      ),
                    ],
                  ),
                if (dailyData.vet ||
                    dailyData.vaccine ||
                    dailyData.pill ||
                    dailyData.eyeDrop)
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.1,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('아프냥'),
                          SizedBox(width: 5),
                          if (dailyData.vet) BoolDiaryIcon('동물병원'),
                          if (dailyData.vaccine) BoolDiaryIcon('예방접종'),
                          if (dailyData.pill) BoolDiaryIcon('약'),
                          if (dailyData.eyeDrop) BoolDiaryIcon('안약'),
                        ],
                      ),
                    ],
                  ),
                if (dailyData.brushTeeth ||
                    dailyData.brushFur ||
                    dailyData.bath ||
                    dailyData.clawCut)
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.1,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('이쁘냥'),
                          SizedBox(width: 5),
                          if (dailyData.brushTeeth) BoolDiaryIcon('치카'),
                          if (dailyData.brushFur) BoolDiaryIcon('빗질'),
                          if (dailyData.bath) BoolDiaryIcon('목욕'),
                          if (dailyData.clawCut) BoolDiaryIcon('발톱깎기'),
                        ],
                      ),
                    ],
                  ),
                if (dailyData.hunting || dailyData.toilet)
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.1,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('건강냥'),
                          SizedBox(width: 5),
                          if (dailyData.hunting) BoolDiaryIcon('사냥놀이'),
                          if (dailyData.toilet) BoolDiaryIcon('전체갈이'),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
          if (dailyData.note.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.1,
                  ),
                ),
              ),
              width: double.infinity,
              child: dailyData.note.isNotEmpty ? Text(dailyData.note) : null,
            ),
          if (dailyData.photos.length > 0)
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('증거물'),
                  SizedBox(width: 8),
                  for (var path in dailyData.photos)
                    Container(
                      width: 54,
                      height: 54,
                      margin: EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          File(path),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
