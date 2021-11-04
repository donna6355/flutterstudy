import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/diary.dart';
import '../model/profile.dart';
import '../widget/diary_card.dart';
import '../widget/calendar.dart';

class DiaryScr extends StatelessWidget {
  final Profile masterInfo;
  DiaryScr(this.masterInfo);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('diary_${masterInfo.id}'),
      builder: (context, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('${masterInfo.name} 다이어리'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(
                    '/profile',
                    arguments: masterInfo,
                  );
                },
                child: Text('프로필'),
              ),
            ],
          ),
          body: ValueListenableBuilder<Box>(
            valueListenable: Hive.box('diary_${masterInfo.id}').listenable(),
            builder: (context, box, child) {
              return Column(
                children: [
                  Calendar(),
                  if (box.length == 0)
                    Container(
                      width: 200,
                      child: Image.asset('asset/img/adorable.png'),
                    ),
                  if (box.length == 0)
                    Text(
                      '이 몸을 관찰하고 기록해라옹!',
                      style: TextStyle(fontSize: 18),
                    ),
                  if (box.length > 0)
                    ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemBuilder: (context, idx) {
                        final Diary daily = box.getAt(idx);
                        return DiaryCard(daily, masterInfo.id, masterInfo.name);
                      },
                      itemCount: box.length,
                    ),
                ],
              );
            },
          ),
          floatingActionButton: ElevatedButton(
            onPressed: () {
              final Map<String, dynamic> args = {
                'master': masterInfo.name,
                'key': masterInfo.id,
                'date': DateTime.now().toString().substring(0, 10),
              };
              Navigator.of(context).pushNamed(
                '/diary_edit',
                arguments: args,
              );
            },
            child: Text(
              '일기 쓰기',
            ),
          ),
        );
      },
    );
  }
}
