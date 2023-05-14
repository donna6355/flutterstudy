import 'package:butler_diary/widget/diary_card_row_bool.dart';
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
      constraints: BoxConstraints(
        minHeight: 400,
      ),
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
                          const Text('컨디션'),
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
                          const Text('드신것'),
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
                          const Text('싸신것'),
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
                  DiaryCardBool(
                    label: '주의!!',
                    firstLabel: '헤어볼',
                    firstVal: dailyData.hairBall,
                    secondLabel: '설사',
                    secondVal: dailyData.diarrhea,
                    thirdLabel: '토켁켁',
                    thirdVal: dailyData.vomit,
                    fourthLabel: '파괴왕',
                    fourthVal: dailyData.destroy,
                  ),
                if (dailyData.vet ||
                    dailyData.vaccine ||
                    dailyData.pill ||
                    dailyData.eyeDrop)
                  DiaryCardBool(
                    label: '아프냥',
                    firstLabel: '동물병원',
                    firstVal: dailyData.vet,
                    secondLabel: '예방접종',
                    secondVal: dailyData.vaccine,
                    thirdLabel: '약',
                    thirdVal: dailyData.pill,
                    fourthLabel: '안약',
                    fourthVal: dailyData.eyeDrop,
                  ),
                if (dailyData.brushTeeth ||
                    dailyData.brushFur ||
                    dailyData.bath ||
                    dailyData.clawCut)
                  DiaryCardBool(
                    label: '이쁘냥',
                    firstLabel: '치카',
                    firstVal: dailyData.brushTeeth,
                    secondLabel: '빗질',
                    secondVal: dailyData.brushFur,
                    thirdLabel: '목욕',
                    thirdVal: dailyData.bath,
                    fourthLabel: '발톱깎기',
                    fourthVal: dailyData.clawCut,
                  ),
                if (dailyData.hunting || dailyData.toilet)
                  DiaryCardBool(
                    label: '건강냥',
                    firstLabel: '사냥놀이',
                    firstVal: dailyData.hunting,
                    secondLabel: '전체갈이',
                    secondVal: dailyData.toilet,
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
                  const Text('증거물'),
                  SizedBox(width: 8),
                  for (var path in dailyData.photos)
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.file(
                                    File(path),
                                    fit: BoxFit.cover,
                                    width: 250,
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
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
