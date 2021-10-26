import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../model/profile.dart';

class ProfileScr extends StatefulWidget {
  final Profile profile;
  ProfileScr(this.profile);

  @override
  _ProfileScrState createState() => _ProfileScrState();
}

class _ProfileScrState extends State<ProfileScr> {
  final _weightCont = TextEditingController();
  final _remarksCont = TextEditingController();
  late Box catBox;
  String charPhoto = 'basic';

  var hasChanged = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.profile.photo != null) {
        charPhoto = widget.profile.photo!;
      }
      if (widget.profile.weight != null) {
        _weightCont.text = '${widget.profile.weight}';
      }
      if (widget.profile.remark != '') {
        _remarksCont.text = widget.profile.remark!;
      }
    });
    catBox = Hive.box('myCats');
  }

  void _hasChanged() {
    setState(() {
      hasChanged = true;
    });
  }

  void _saveProfile() {
    if (!hasChanged) return;
    final Profile newCat = Profile(
        id: widget.profile.id,
        name: widget.profile.name,
        birth: widget.profile.birth,
        gender: widget.profile.gender,
        photo: charPhoto,
        weight:
            _weightCont.text.isEmpty ? null : double.parse(_weightCont.text),
        remark: _remarksCont.text.isEmpty ? '' : _remarksCont.text);
    catBox.put(newCat.id, newCat);

    Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('프로필'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(
                '/diary',
                arguments: widget.profile,
              );
            },
            icon: Icon(Icons.calendar_today_outlined),
          ),
        ],
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
                    width: 100,
                    height: 100,
                    child: Image.asset('asset/img/$charPhoto.jpeg'),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: charPhoto == 'basic' ? Color(0xff454442) : null,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            hasChanged = true;
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
                    width: 50,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: charPhoto == 'elegant' ? Color(0xff454442) : null,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            hasChanged = true;
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
                    width: 50,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: charPhoto == 'dynamic' ? Color(0xff454442) : null,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            hasChanged = true;
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
                    width: 50,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: charPhoto == 'sleepy' ? Color(0xff454442) : null,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            hasChanged = true;
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
                    width: 50,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: charPhoto == 'weird' ? Color(0xff454442) : null,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            hasChanged = true;
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
                  Text(widget.profile.name),
                ],
              ),
              SizedBox(height: 15),
              Row(
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
                  Text(
                      '${widget.profile.birth.year}년 ${widget.profile.birth.month}월 ${widget.profile.birth.day}일${ageCalc(widget.profile.birth)}'),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    child: Text(
                      '성별',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    width: 60,
                  ),
                  Text(widget.profile.gender == 1 ? '남자아이' : '여자아이'),
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
                      onChanged: (_) {
                        _hasChanged();
                      },
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
                onChanged: (_) {
                  _hasChanged();
                },
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
              Opacity(
                opacity: hasChanged ? 1.0 : 0.5,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  child: Text('저장하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
