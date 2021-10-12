import 'package:flutter/material.dart';
import '../model/diary.dart';

class DiaryEditScr extends StatefulWidget {
  final Map<String, dynamic> masterInfo;
  DiaryEditScr(this.masterInfo);
  @override
  _DiaryEditScrState createState() => _DiaryEditScrState();
}

class _DiaryEditScrState extends State<DiaryEditScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.masterInfo['master']} 일기쓰기')),
      body: Container(
        child: Column(
          children: [
            Text(widget.masterInfo['date']),
            Text(
              widget.masterInfo['master'],
            ),
          ],
        ),
      ),
    );
  }
}
