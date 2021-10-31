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
          ),
          body: ValueListenableBuilder<Box>(
            valueListenable: Hive.box('diary_${masterInfo.id}').listenable(),
            builder: (context, box, widget) {
              if (box.length == 0)
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.fromLTRB(50, 70, 50, 40),
                      child: Image.asset('asset/img/ontop.png'),
                    ),
                    Text(
                      '매일매일 이 몸을 잘 관찰하고 기록해라옹!',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                );
              return ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, idx) {
                  final Diary daily = box.getAt(idx);
                  return DiaryCard(daily, masterInfo.id, masterInfo.name);
                },
                itemCount: box.length,
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
