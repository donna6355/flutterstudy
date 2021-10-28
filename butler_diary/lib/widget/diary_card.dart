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
    return GestureDetector(
      onTap: () {
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
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
          ),
          border: Border.all(
            width: 1.0,
            color: Color(0xff454442),
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Text(
                '☼ ${dailyData.date}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  if (dailyData.dryFood != -1)
                    MultiDiaryIcon(dailyData.dryFood, 'tbd', '습식 실타냥', '습식 쪼오금',
                        '습식 적당히', '습식 왕창!'),
                  if (dailyData.wetFood != -1)
                    MultiDiaryIcon(dailyData.wetFood, 'tbd', '건식 실타냥', '건식 쪼오금',
                        '건식 적당히', '건식 왕창!'),
                  if (dailyData.water != -1)
                    MultiDiaryIcon(dailyData.water, 'tbd', '물 실타냥', '사알짝 할짝',
                        '하알짝 할짝', '물먹는 하마'),
                  if (dailyData.waterySnack) BoolDiaryIcon('츄르'),
                  if (dailyData.drySnack) BoolDiaryIcon('트릿'),
                  if (dailyData.snack) BoolDiaryIcon('캔'),
                  if (dailyData.otherSnack) BoolDiaryIcon('기타'),
                  if (dailyData.poo != -1)
                    MultiDiaryIcon(
                        dailyData.poo, 'tbd', '변비냥', '반토막', '한토막', '한움큼'),
                  if (dailyData.pee != -1)
                    MultiDiaryIcon(
                        dailyData.pee, 'tbd', '으잉?', '알감자', '감자', '왕감자'),
                  if (dailyData.hairBall) BoolDiaryIcon('헤어볼'),
                  if (dailyData.diarrhea) BoolDiaryIcon('설사'),
                  if (dailyData.vomit) BoolDiaryIcon('토켁켁'),
                  if (dailyData.destroy) BoolDiaryIcon('파괴왕'),
                  if (dailyData.vet) BoolDiaryIcon('동물병원'),
                  if (dailyData.vaccine) BoolDiaryIcon('예방접종'),
                  if (dailyData.pill) BoolDiaryIcon('약'),
                  if (dailyData.eyeDrop) BoolDiaryIcon('안약'),
                  if (dailyData.brushTeeth) BoolDiaryIcon('치카'),
                  if (dailyData.brushFur) BoolDiaryIcon('빗질'),
                  if (dailyData.bath) BoolDiaryIcon('목욕'),
                  if (dailyData.clawCut) BoolDiaryIcon('발톱깎기'),
                  if (dailyData.hunting) BoolDiaryIcon('사냥놀이'),
                  if (dailyData.toilet) BoolDiaryIcon('전체갈이'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              child: dailyData.note.isNotEmpty ? Text(dailyData.note) : null,
            ),
            if (dailyData.photos.length > 0)
              Container(
                margin: EdgeInsets.only(top: 25),
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    for (var path in dailyData.photos)
                      Container(
                        width: 80,
                        height: 50,
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
      ),
    );
  }
}
