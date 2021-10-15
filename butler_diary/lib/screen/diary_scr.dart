import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/diary.dart';

class DiaryScr extends StatelessWidget {
  final String masterKey;
  DiaryScr(this.masterKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('$masterKey 다이어리'),
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
                      'master': masterKey,
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
        valueListenable: Hive.box(masterKey).listenable(),
        builder: (context, box, widget) {
          return ListView.builder(
            itemBuilder: (context, idx) {
              final Diary daily = box.getAt(idx);
              print(daily);
              return Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xff454442),
                  ),
                ),
                child: Text(daily.date),
              );
            },
            itemCount: box.length,
          );
        },
      ),
    );
  }
}
