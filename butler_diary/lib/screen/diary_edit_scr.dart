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
  List<dynamic> photos = [];
  late Box diaryBox;

  void saveDiary() {
    final Diary newDiary = Diary(
      date: date,
      dryFood: dryFood,
      wetFood: wetFood,
      water: water,
      waterySnack: waterySnack,
      drySnack: drySnack,
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
      bath: bath,
      toilet: toilet,
      note: note,
      photos: photos,
    );
    diaryBox.put(date, newDiary);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
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
        dryFood = dailyData.dryFood;
        wetFood = dailyData.wetFood;
        water = dailyData.water;
        waterySnack = dailyData.waterySnack;
        drySnack = dailyData.drySnack;
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
        bath = dailyData.bath;
        toilet = dailyData.toilet;
        note = dailyData.note;
        photos = dailyData.photos;
      });
      //connect data to local state;
    }
  }

  void togglesetState(String name) {
    setState(() {
      switch (name) {
        case '츄르':
          waterySnack = !waterySnack;
          break;
        case '트릿':
          drySnack = !drySnack;
          break;
        case '통살':
          snack = !snack;
          break;
        case '기타':
          waterySnack = !waterySnack;
          break;
        default:
          break;
      }
    });
  }

  void doubleSetState(String name, double value) {
    setState(() {
      switch (name) {
        case '습식 실타냥':
          wetFood = value;
          break;
        case '건식 실타냥':
          dryFood = value;
          break;
        case '물은 실타냥':
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${date.substring(0, 4)}년 ${date.substring(5, 7)}월 ${date.substring(8, 10)}일 ${widget.masterInfo['master']} 일기'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(DateTime.now().year + 1),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
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
            icon: Icon(Icons.calendar_today_outlined),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: saveDiary,
        child: Text('저장하기'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
          child: ListView(
            children: [
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
              MultipleChoice('물은 실타냥', '사알짝 할짝', '하알짝 할짝', '물먹는 하마', water,
                  doubleSetState),
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
                    ToggleChoice('통살', snack, togglesetState),
                    ToggleChoice('기타', false, togglesetState),
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
                    ToggleChoice('수의사쌤', vet, togglesetState),
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
                    ToggleChoice('사냥놀이', hunting, togglesetState),
                    ToggleChoice('치카', brushTeeth, togglesetState),
                    ToggleChoice('빗질', brushFur, togglesetState),
                    ToggleChoice('목욕', bath, togglesetState),
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
                    ToggleChoice('전체갈이', toilet, togglesetState),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                '눈물의 집사 일기',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'ex) 또 충전기 씹어드심ㅠ 물그릇 엎고 물놀이 함ㅠ',
                ),
              ),
              SizedBox(height: 30),
              Text(
                '증거 사진',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
