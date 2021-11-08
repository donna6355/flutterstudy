import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/diary.dart';
import '../model/profile.dart';
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
              List writtenStringDates = box.keys.toList();
              Map<String, List<Diary>> writtenDate = {};
              writtenStringDates
                  .forEach((key) => writtenDate[key] = [box.get(key)]);
              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Calendar(writtenDate, masterInfo.id, masterInfo.name),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
