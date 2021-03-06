import 'package:butler_diary/widget/toggle_choice.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/diary.dart';
import '../widget/multiple_choice.dart';
import '../widget/toggle_choice.dart';
import '../widget/input_img.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../provider/my-selected-date.dart';
import 'package:provider/provider.dart';

class DiaryEditScr extends StatefulWidget {
  final Map<String, dynamic> masterInfo;
  DiaryEditScr(this.masterInfo);
  @override
  _DiaryEditScrState createState() => _DiaryEditScrState();
}

class _DiaryEditScrState extends State<DiaryEditScr> {
  final _note = TextEditingController();
  String date = '';
  double feel = -1;
  double dryFood = -1;
  double wetFood = -1;
  double water = -1;
  bool waterySnack = false;
  bool drySnack = false;
  bool snack = false;
  bool otherSnack = false;
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
  bool clawCut = false;
  bool bath = false;
  bool toilet = false;
  String note = '';
  List<dynamic> photos = [];
  late Box diaryBox;
  bool hasChanged = false;

  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// // show notification right away
//   Future _showNotification() async {
//     String title = '';
//     if (vet) title += ' 동물병원';
//     if (vaccine) title += ' 예방접종';
//     if (pill) title += ' 약';
//     if (eyeDrop) title += ' 안약';
//     if (bath) title += ' 목욕';
//     if (toilet) title += ' 화장실 전체갈이';

//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       channelDescription: 'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       '${widget.masterInfo['master']}$title',
//       '왥옹 윩얅웅 읽앇',
//       platformChannelSpecifics,
//       payload: '${widget.masterInfo['master']}',
//     );
//   }

  Future _setNotification() async {
    int notiId = int.parse(date.replaceAll('-', ''));
    String title = '';
    if (vet) title += ' 동물병원';
    if (vaccine) title += ' 예방접종';
    if (pill) title += ' 약';
    if (eyeDrop) title += ' 안약';
    if (bath) title += ' 목욕';
    if (toilet) title += ' 화장실 전체갈이';
    final remaining = DateTime.parse(date).difference(DateTime.now()).inSeconds;

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      notiId,
      '${widget.masterInfo['master']}$title',
      '왥옹 윩 얅웅 읽앇',
      tz.TZDateTime.now(tz.local).add(Duration(seconds: remaining)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
            'your channel id', 'your channel name',
            channelDescription: 'your channel description', icon: 'app_icon'),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  bool _checkNotiAvail() {
    if (DateTime.now().isBefore(DateTime.parse(date)))
      return vet || vaccine || pill || eyeDrop || bath || toilet ? true : false;
    else
      return false;
  }

  void saveDiary() async {
    if (!hasChanged) return;
    if (feel == -1 &&
        dryFood == -1 &&
        wetFood == -1 &&
        water == -1 &&
        waterySnack == false &&
        drySnack == false &&
        snack == false &&
        otherSnack == false &&
        pee == -1 &&
        poo == -1 &&
        hairBall == false &&
        diarrhea == false &&
        vomit == false &&
        destroy == false &&
        vet == false &&
        vaccine == false &&
        pill == false &&
        eyeDrop == false &&
        hunting == false &&
        brushTeeth == false &&
        brushFur == false &&
        clawCut == false &&
        bath == false &&
        toilet == false &&
        note == '' &&
        photos.length == 0) {
      diaryBox.delete(date);
      int notiId = int.parse(date.replaceAll('-', ''));
      await _flutterLocalNotificationsPlugin.cancel(notiId);
      Navigator.of(context).pop();
      return;
    }
    if (_checkNotiAvail()) _setNotification();
    final Diary newDiary = Diary(
      date: date,
      feel: feel,
      dryFood: dryFood,
      wetFood: wetFood,
      water: water,
      waterySnack: waterySnack,
      drySnack: drySnack,
      otherSnack: otherSnack,
      snack: snack,
      pee: pee,
      poo: poo,
      hairBall: hairBall,
      diarrhea: diarrhea,
      vomit: vomit,
      destroy: destroy,
      vet: vet,
      vaccine: vaccine,
      pill: pill,
      eyeDrop: eyeDrop,
      hunting: hunting,
      brushTeeth: brushTeeth,
      brushFur: brushFur,
      clawCut: clawCut,
      bath: bath,
      toilet: toilet,
      note: _note.text,
      photos: photos,
    );
    diaryBox.put(date, newDiary);

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    setState(() {
      date = widget.masterInfo['date'];
    });
    diaryBox = Hive.box('diary_${widget.masterInfo['key']}');
    final Diary? dailyData = diaryBox.get(widget.masterInfo['date']);
    date = widget.masterInfo['date'];
    if (dailyData == null) {
      return;
    } else {
      setState(() {
        feel = dailyData.feel;
        dryFood = dailyData.dryFood;
        wetFood = dailyData.wetFood;
        water = dailyData.water;
        waterySnack = dailyData.waterySnack;
        drySnack = dailyData.drySnack;
        otherSnack = dailyData.otherSnack;
        snack = dailyData.snack;
        pee = dailyData.pee;
        poo = dailyData.poo;
        hairBall = dailyData.hairBall;
        diarrhea = dailyData.diarrhea;
        vomit = dailyData.vomit;
        destroy = dailyData.destroy;
        vet = dailyData.vet;
        vaccine = dailyData.vaccine;
        pill = dailyData.pill;
        eyeDrop = dailyData.eyeDrop;
        hunting = dailyData.hunting;
        brushTeeth = dailyData.brushTeeth;
        brushFur = dailyData.brushFur;
        clawCut = dailyData.clawCut;
        bath = dailyData.bath;
        toilet = dailyData.toilet;
        note = dailyData.note;
        _note.text = dailyData.note.isNotEmpty ? dailyData.note : '';
        if (dailyData.photos.length > 0) {
          dailyData.photos.forEach((path) => {photos.add(path)});
        }
      });
    }
  }

  void togglesetState(String name) {
    setState(() {
      hasChanged = true;
      switch (name) {
        case '츄르':
          waterySnack = !waterySnack;
          break;
        case '트릿':
          drySnack = !drySnack;
          break;
        case '습식':
          snack = !snack;
          break;
        case '기타':
          otherSnack = !otherSnack;
          break;
        case '헤어볼':
          hairBall = !hairBall;
          break;
        case '설사':
          diarrhea = !diarrhea;
          break;
        case '토켁켁':
          vomit = !vomit;
          break;
        case '파괴왕':
          destroy = !destroy;
          break;
        case '동물병원':
          vet = !vet;
          break;
        case '예방접종':
          vaccine = !vaccine;
          break;
        case '약':
          pill = !pill;
          break;
        case '안약':
          eyeDrop = !eyeDrop;
          break;
        case '사냥놀이':
          hunting = !hunting;
          break;
        case '치카':
          brushTeeth = !brushTeeth;
          break;
        case '빗질':
          brushFur = !brushFur;
          break;
        case '목욕':
          bath = !bath;
          break;
        case '발톱깎기':
          clawCut = !clawCut;
          break;
        case '전체갈이':
          toilet = !toilet;
          break;
        default:
          note = _note.text;
          break;
      }
    });
  }

  void doubleSetState(String name, double value) {
    hasChanged = true;
    setState(() {
      switch (name) {
        case '뭘보냥':
          feel = value;
          break;
        case '습식 실타냥':
          wetFood = value;
          break;
        case '건식 실타냥':
          dryFood = value;
          break;
        case '물 실타냥':
          water = value;
          break;
        case '변비냥':
          poo = value;
          break;
        case '으잉?':
          pee = value;
          break;
        default:
          break;
      }
    });
  }

  void addPic(newImg) {
    setState(() {
      hasChanged = true;
      photos.add(newImg.path);
    });
  }

  void _removePhoto(path) {
    setState(() {
      hasChanged = true;
      photos.removeWhere((el) => el == path);
    });
  }

  @override
  void dispose() {
    super.dispose();
    date = '';
    dryFood = -1;
    wetFood = -1;
    water = -1;
    waterySnack = false;
    drySnack = false;
    snack = false;
    otherSnack = false;
    pee = -1;
    poo = -1;
    hairBall = false;
    diarrhea = false;
    vomit = false;
    destroy = false;
    vet = false;
    vaccine = false;
    pill = false;
    eyeDrop = false;
    hunting = false;
    brushTeeth = false;
    brushFur = false;
    bath = false;
    toilet = false;
    note = '';
    photos = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${date.substring(0, 4)}년 ${date.substring(5, 7)}월 ${date.substring(8, 10)}일 ${widget.masterInfo['master']} 일기'),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: Provider.of<MySelectedDate>(context, listen: false)
                    .getSelectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(DateTime.now().year + 1,
                    DateTime.now().month, DateTime.now().day),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      textTheme: const TextTheme(
                        headline4: TextStyle(
                          //datepicker 11월 3일 (수)
                          fontSize: 24,
                          fontFamily: 'GamjaFlower',
                        ),
                        subtitle2: TextStyle(
                          //datepicker 2021년 11월
                          fontFamily: 'GamjaFlower',
                        ),
                        caption: TextStyle(
                          //datepicker whole calendar
                          fontFamily: 'GamjaFlower',
                        ),
                        button: TextStyle(
                          //datepicker button
                          fontFamily: 'GamjaFlower',
                        ),
                        overline: TextStyle(
                          fontFamily: 'GamjaFlower',
                          fontSize: 16,
                        ),
                      ),
                      colorScheme: ColorScheme.light().copyWith(
                        primary: Color(0xff454442),
                      ),
                    ), // This will change to light theme.
                    child: child!,
                  );
                },
              ).then((pickedDate) {
                // Check if no date is selected
                if (pickedDate == null) {
                  return;
                }
                Provider.of<MySelectedDate>(context, listen: false)
                    .updateSelectedDate(pickedDate, pickedDate);
                final Map<String, dynamic> args = {
                  'master': widget.masterInfo['master'],
                  'key': widget.masterInfo['key'],
                  'date': pickedDate.toString().substring(0, 10),
                };
                Navigator.of(context).popAndPushNamed(
                  '/diary_edit',
                  arguments: args,
                );
              });
            },
            child: Text('다른날짜'),
          ),
        ],
      ),
      floatingActionButton: Opacity(
        opacity: hasChanged ? 1.0 : 0.5,
        child: ElevatedButton(
          onPressed: saveDiary,
          child: Text('저장하기'),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Text(
                '주인님 컨디션',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              MultipleChoice('뭘보냥', '나쁘냥', '구냥', '죠타냥', feel, doubleSetState),
              SizedBox(height: 30),
              Text(
                '주인님 식사',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              MultipleChoice('습식 실타냥', '습식 쪼오금', '습식 적당히', '습식 왕창!', wetFood,
                  doubleSetState),
              MultipleChoice('건식 실타냥', '건식 쪼오금', '건식 적당히', '건식 왕창!', dryFood,
                  doubleSetState),
              SizedBox(height: 30),
              Text(
                '주인님 물',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              MultipleChoice(
                  '물 실타냥', '사알짝 할짝', '하알짝 할짝', '물먹는 하마', water, doubleSetState),
              SizedBox(height: 30),
              Text(
                '주인님 간식',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleChoice('츄르', waterySnack, togglesetState),
                    ToggleChoice('트릿', drySnack, togglesetState),
                    ToggleChoice('습식', snack, togglesetState),
                    ToggleChoice('기타', otherSnack, togglesetState),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                '향기로운 맛동산',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              MultipleChoice('변비냥', '반토막', '한토막', '한움큼', poo, doubleSetState),
              SizedBox(height: 30),
              Text(
                '따끈따끈 감자',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              MultipleChoice('으잉?', '알감자', '감자', '왕감자', pee, doubleSetState),
              SizedBox(height: 30),
              Text(
                '집사야 관심 가져달라옹!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleChoice('헤어볼', hairBall, togglesetState),
                    ToggleChoice('설사', diarrhea, togglesetState),
                    ToggleChoice('토켁켁', vomit, togglesetState),
                    ToggleChoice('파괴왕', destroy, togglesetState),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                '나 아픈거냐옹?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleChoice('동물병원', vet, togglesetState),
                    ToggleChoice('예방접종', vaccine, togglesetState),
                    ToggleChoice('약', pill, togglesetState),
                    ToggleChoice('안약', eyeDrop, togglesetState),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                '건강하고 아름다운 주인님 관리',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleChoice('치카', brushTeeth, togglesetState),
                    ToggleChoice('빗질', brushFur, togglesetState),
                    ToggleChoice('목욕', bath, togglesetState),
                    ToggleChoice('발톱깎기', clawCut, togglesetState),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleChoice('사냥놀이', hunting, togglesetState),
                    ToggleChoice('전체갈이', toilet, togglesetState),
                    SizedBox(width: 67),
                    SizedBox(width: 67),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                '눈물의 집사 일기',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              TextField(
                cursorColor: Color(0xff454442),
                onChanged: togglesetState,
                controller: _note,
                maxLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'ex) 충전기 씹어드심ㅠ',
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 30),
              Text(
                '증거 사진 ${photos.length > 0 ? "(${photos.length})" : ""}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              InputImg(addPic),
              SizedBox(height: 10),
              if (photos.length > 0)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (var path in photos)
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.file(
                                File(path),
                                fit: BoxFit.cover,
                                width: 200,
                              ),
                            ),
                          ),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 14,
                              ),
                              IconButton(
                                color: Color(0xff454442),
                                iconSize: 26,
                                onPressed: () {
                                  _removePhoto(path);
                                },
                                icon: Icon(Icons.cancel),
                              ),
                            ],
                          ),
                        ],
                      )
                  ],
                ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
