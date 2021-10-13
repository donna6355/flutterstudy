import 'package:butler_diary/widget/toggle_choice.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/diary.dart';
import '../widget/multiple_choice.dart';
import '../widget/toggle_choice.dart';

class DiaryEditScr extends StatefulWidget {
  final Map<String, dynamic> masterInfo;
  DiaryEditScr(this.masterInfo);
  @override
  _DiaryEditScrState createState() => _DiaryEditScrState();
}

class _DiaryEditScrState extends State<DiaryEditScr> {
  String date = '';
  double dryFood = -1;
  double wetFood = -1;
  double water = -1;
  bool waterySnack = false;
  bool drySnack = false;
  bool snack = false;
  double pee = -1;
  double poo = -1;
  bool hairBall = false;
  bool diarrhea = false;
  bool vomit = false;
  bool destroy = false;
  bool vet = false;
  bool vaccine = false;
  bool pill = false;
  bool eyeDrop = false;
  bool hunting = false;
  bool brushTeeth = false;
  bool brushFur = false;
  bool bath = false;
  bool toilet = false;
  String note = '';
  List<String> photos = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      date = widget.masterInfo['date'];
    });
    final Box diaryBox = Hive.box(widget.masterInfo['master']);
    final Diary? dailyData = diaryBox.get(widget.masterInfo['date']);
    if (dailyData == null) {
      return;
    } else {
      //connect data to local state;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${widget.masterInfo['master']} 일기쓰기 - ${date.substring(0, 4)}년 ${date.substring(5, 7)}월 ${date.substring(8, 10)}일'),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
        child: ListView(
          children: [
            // Row(
            //   children: [
            //     Container(
            //       margin: EdgeInsets.only(bottom: 15),
            //       child: Text(
            //         '${date.substring(0, 4)}년 ${date.substring(5, 7)}월 ${date.substring(8, 10)}일',
            //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ],
            // ),
            Text(
              '사료',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            MultipleChoice('습식 실타냥', '습식 쪼오금', '습식 적당히', '습식 왕창!', wetFood),
            MultipleChoice('건식 실타냥', '건식 쪼오금', '건식 적당히', '건식 왕창!', dryFood),
            SizedBox(height: 30),
            Text(
              '물',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            MultipleChoice('물은 실타냥', '사알짝 할짝', '하알짝 할짝', '물먹는 하마', water),
            SizedBox(height: 30),
            Text(
              '간식',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ToggleChoice('츄르', waterySnack),
                  ToggleChoice('트릿', drySnack),
                  ToggleChoice('통살', snack),
                  ToggleChoice('기타', false),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              '맛동산',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            MultipleChoice('변비냥', '반토막', '한토막', '한움큼', poo),
            SizedBox(height: 30),
            Text(
              '감자',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            MultipleChoice('으잉?', '알감자', '감자', '왕감자', pee),
          ],
        ),
      ),
    );
  }
}
