import 'package:flutter/material.dart';
import '../model/diary.dart';

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
            Wrap(
              children: [
                if (dailyData.dryFood != -1) Text('dryFood'),
                if (dailyData.wetFood != -1) Text('wetFood'),
                if (dailyData.water != -1) Text('water'),
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
          ],
        ),
      ),
    );
  }
}
