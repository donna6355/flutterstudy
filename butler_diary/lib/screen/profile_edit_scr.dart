import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../model/profile.dart';
import 'package:uuid/uuid.dart';

class ProfileEditScr extends StatefulWidget {
  @override
  _ProfileEditScrState createState() => _ProfileEditScrState();
}

class _ProfileEditScrState extends State<ProfileEditScr> {
  final _nameCont = TextEditingController();
  final _remarksCont = TextEditingController();
  final _weightCont = TextEditingController();
  DateTime? birth;
  int gender = -1;
  String charPhoto = 'basic';
  late Box catBox;
  var uuid = Uuid();

  @override
  void initState() {
    super.initState();
    catBox = Hive.box('myCats');
  }

  @override
  void dispose() {
    super.dispose();
  }

  String ageCalc(DateTime birth) {
    DateTime now = DateTime.now();

    int years = now.year - birth.year;
    int months = now.month - birth.month;
    int days = now.day - birth.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += (days < 0 ? 11 : 12);
    }

    return years > 0 ? ' / $years년 $months개월' : ' / $months개월';
  }

  void _saveProfile() {
    if (_nameCont.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('이름을 작성해 주세요!')));
      return;
    } else {
      final List catList = catBox.values.toList();
      bool needToStop = false;
      catList.forEach((element) {
        if (element.name == _nameCont.text) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('도플갱어냥?? 이미 모시고 있는 주인님이다옹!')));
          needToStop = true;
          return;
        }
      });
      if (needToStop) return;
    }
    if (gender == -1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('성별을 선택해 주세요!')));
      return;
    }
    if (birth == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('생일을 선택해 주세요!')));
      return;
    }
    final Profile newCat = Profile(
        id: uuid.v1(),
        name: _nameCont.text,
        birth: birth!,
        gender: gender,
        photo: charPhoto,
        weight:
            _weightCont.text.isEmpty ? null : double.parse(_weightCont.text),
        remark: _remarksCont.text.isEmpty ? '' : _remarksCont.text);
    catBox.put(newCat.id, newCat);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새 주인님 프로필'),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: ListView(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.white,
                    width: 100,
                    height: 100,
                    child: Image.asset('asset/img/${charPhoto}1.png'),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 55,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: charPhoto == 'basic' ? Color(0xff454442) : null,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            charPhoto = 'basic';
                          });
                        },
                        child: Text(
                          '기본냥',
                          style: charPhoto == 'basic'
                              ? TextStyle(
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 55,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: charPhoto == 'elegant' ? Color(0xff454442) : null,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            charPhoto = 'elegant';
                          });
                        },
                        child: Text(
                          '우아냥',
                          style: charPhoto == 'elegant'
                              ? TextStyle(
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 55,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: charPhoto == 'dynamic' ? Color(0xff454442) : null,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            charPhoto = 'dynamic';
                          });
                        },
                        child: Text(
                          '활발냥',
                          style: charPhoto == 'dynamic'
                              ? TextStyle(
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 55,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: charPhoto == 'sleepy' ? Color(0xff454442) : null,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            charPhoto = 'sleepy';
                          });
                        },
                        child: Text(
                          '쿨쿨냥',
                          style: charPhoto == 'sleepy'
                              ? TextStyle(
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 55,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: charPhoto == 'weird' ? Color(0xff454442) : null,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            charPhoto = 'weird';
                          });
                        },
                        child: Text(
                          '이상냥',
                          style: charPhoto == 'weird'
                              ? TextStyle(
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '이름',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    width: 60,
                  ),
                  Container(
                    width: 200,
                    child: TextField(
                      controller: _nameCont,
                      maxLength: 6,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'ex) 김미르',
                        counterText: '',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 45,
                    child: Text(
                      '성별',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: Radio(
                          activeColor: Color(0xff454442),
                          value: 1,
                          groupValue: gender,
                          onChanged: (value) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              gender = value as int;
                            });
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            gender = 1;
                          });
                        },
                        child: Text('남자아이'),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: Radio(
                          activeColor: Color(0xff454442),
                          value: 2,
                          groupValue: gender,
                          onChanged: (value) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              gender = value as int;
                            });
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            gender = 2;
                          });
                        },
                        child: Text('여자아이'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '생일',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    width: 60,
                  ),
                  Text(birth == null
                      ? 'XXXX년 XX월 XX일'
                      : '${birth!.year}년 ${birth!.month}월 ${birth!.day}일'),
                  if (birth != null) Text(ageCalc(birth!)),
                  IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      //https://medium.com/flutter-community/a-deep-dive-into-datepicker-in-flutter-37e84f7d8d6c
                      showDatePicker(
                        context: context,
                        helpText: '주인님 생일 선택',
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        initialDatePickerMode: DatePickerMode.year,
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

                        setState(() {
                          // using state so that the UI will be rerendered when date is picked
                          birth = pickedDate;
                        });
                      });
                    },
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xff454442),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '몸무게',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    width: 60,
                  ),
                  Container(
                    width: 80,
                    child: TextField(
                      controller: _weightCont,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(),
                        hintText: 'ex) 5.1',
                      ),
                    ),
                  ),
                  Text(
                    'kg',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 20,
                child: Text(
                  '기타',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextField(
                controller: _remarksCont,
                maxLines: 2,
                maxLength: 100,
                decoration: InputDecoration(
                  hintText: 'ex) 땅콩 털림',
                  counterText: '',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('저장하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
