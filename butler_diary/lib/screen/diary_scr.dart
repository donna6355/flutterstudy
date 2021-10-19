import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/diary.dart';
import '../model/profile.dart';
import '../widget/diary_card.dart';

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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
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
                      icon: Icon(Icons.add),
                    ),
                  ),
                  Text(
                    '일기쓰기',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: ValueListenableBuilder<Box>(
            valueListenable: Hive.box('diary_${masterInfo.id}').listenable(),
            builder: (context, box, widget) {
              return ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, idx) {
                  final Diary daily = box.getAt(idx);
                  print(daily);
                  return DiaryCard(daily, masterInfo.id, masterInfo.name);
                },
                itemCount: box.length,
              );
            },
          ),
        );
      },
    );
  }
}
