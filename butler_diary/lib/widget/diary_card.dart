import 'package:flutter/material.dart';
import '../model/diary.dart';
import './multi_diary_icon.dart';

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
                    MultiDiaryIcon(dailyData.water, 'tbd', '물은 실타냥', '사알짝 할짝',
                        '하알짝 할짝', '물먹는 하마'),
                  if (dailyData.waterySnack) Text('츄르'),
                  if (dailyData.drySnack) Text('트릿'),
                  if (dailyData.snack) Text('캔'),
                  if (dailyData.poo != -1)
                    MultiDiaryIcon(
                        dailyData.poo, 'tbd', '변비냥', '반토막', '한토막', '한움큼'),
                  if (dailyData.pee != -1)
                    MultiDiaryIcon(
                        dailyData.pee, 'tbd', '으잉?', '알감자', '감자', '왕감자'),
                  if (dailyData.hairBall) Text('헤어볼'),
                  if (dailyData.diarrhea) Text('설사'),
                  if (dailyData.vomit) Text('토켁켁'),
                  if (dailyData.destroy) Text('파괴왕'),
                  if (dailyData.vet) Text('동물병원'),
                  if (dailyData.vaccine) Text('예방접종'),
                  if (dailyData.pill) Text('약'),
                  if (dailyData.eyeDrop) Text('안약'),
                  if (dailyData.hunting) Text('사냥놀이'),
                  if (dailyData.brushTeeth) Text('치카'),
                  if (dailyData.brushFur) Text('빗질'),
                  if (dailyData.bath) Text('목욕'),
                  if (dailyData.toilet) Text('전체갈이'),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: dailyData.note.isNotEmpty ? Text(dailyData.note) : null,
            ),
            if (dailyData.photos.length > 0)
              Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Text('photos'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
