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
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
