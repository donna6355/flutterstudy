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
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Color(0xff454442),
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Text(dailyData.date),
              width: double.infinity,
            ),
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
                  if (dailyData.waterySnack) Text('waterySnack'),
                  if (dailyData.drySnack) Text('drySnack'),
                  if (dailyData.snack) Text('snack'),
                  if (dailyData.pee != -1) Text('pee'),
                  if (dailyData.poo != -1) Text('poo'),
                  if (dailyData.hairBall) Text('hairBall'),
                  if (dailyData.diarrhea) Text('diarrhea'),
                  if (dailyData.vomit) Text('vomit'),
                  if (dailyData.destroy) Text('destroy'),
                  if (dailyData.vet) Text('vet'),
                  if (dailyData.vaccine) Text('vaccine'),
                  if (dailyData.pill) Text('pill'),
                  if (dailyData.eyeDrop) Text('eyeDrop'),
                  if (dailyData.hunting) Text('hunting'),
                  if (dailyData.brushTeeth) Text('brushTeeth'),
                  if (dailyData.brushFur) Text('brushFur'),
                  if (dailyData.bath) Text('bath'),
                  if (dailyData.toilet) Text('toilet'),
                  if (dailyData.note.isNotEmpty) Text(dailyData.note),
                  if (dailyData.photos.length > 0) Text('photos'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
