import 'package:flutter/material.dart';
import '../widget/drawer_profile.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/diary.dart';

class DiaryScr extends StatefulWidget {
  final String masterKey;
  DiaryScr(this.masterKey);

  @override
  _DiaryScrState createState() => _DiaryScrState();
}

class _DiaryScrState extends State<DiaryScr> {
  @override
  void initState() {
    super.initState();
    Hive.openBox(widget.masterKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerProfile(),
      appBar: AppBar(
        title: Text('${widget.masterKey} 다이어리'),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {},
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
        valueListenable: Hive.box(widget.masterKey).listenable(),
        builder: (context, box, widget) {
          return Text('box');
        },
      ),
    );
  }
}
