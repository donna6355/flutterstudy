import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../model/profile.dart';
import './living_room.dart';

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

  Future<void> _removeProfile() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${widget.profile.name} 프로필 지우기'),
          content: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ListBody(
              children: const <Widget>[
                Text('프로필을 삭제한다옹!'),
                Text('지워진 데이터는 복구가 불가능하다옹!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
                Hive.deleteBoxFromDisk('diary_${widget.profile.id}');
                catBox.delete(widget.profile.id);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => LivingRoom()),
                  ModalRoute.withName('/'),
                );
              },
            ),
          ],
        );
      },
    );
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
    final _isPhone = MediaQuery.of(context).size.shortestSide < 550;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('${widget.profile.name} 프로필'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(
                '/diary',
                arguments: widget.profile,
              );
            },
            child: Text('일기'),
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
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.white,
                    width: _isPhone ? 100 : 160,
                    height: _isPhone ? 100 : 160,
                    child: Image.asset('asset/img/${charPhoto}1.png'),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 57,
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
                    width: 57,
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
                    width: 57,
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
                    width: 57,
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
                    width: 57,
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
                    width: _isPhone ? 60 : 80,
                  ),
                  Text(
                    widget.profile.name,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
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
                    width: _isPhone ? 60 : 80,
                  ),
                  Text(
                    '${widget.profile.birth.year}년 ${widget.profile.birth.month}월 ${widget.profile.birth.day}일${ageCalc(widget.profile.birth)}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
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
                    width: _isPhone ? 60 : 80,
                  ),
                  Text(
                    widget.profile.gender == 1 ? '남자아이' : '여자아이',
                    style: TextStyle(
                      fontSize: 18,
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
                    width: _isPhone ? 60 : 80,
                  ),
                  Container(
                    width: 80,
                    child: TextField(
                      cursorColor: Color(0xff454442),
                      onChanged: (_) {
                        _hasChanged();
                      },
                      controller: _weightCont,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(),
                        hintText: 'ex) 5.1',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff454442), width: 2.0),
                        ),
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
                cursorColor: Color(0xff454442),
                onChanged: (_) {
                  _hasChanged();
                },
                controller: _remarksCont,
                maxLines: 2,
                maxLength: 100,
                decoration: InputDecoration(
                  hintText: 'ex) 땅콩 털림',
                  counterText: '',
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff454442), width: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Opacity(
                      opacity: 0.5,
                      child: ElevatedButton(
                        onPressed: _removeProfile,
                        child: Text('삭제하기'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Opacity(
                      opacity: hasChanged ? 1.0 : 0.5,
                      child: ElevatedButton(
                        onPressed: _saveProfile,
                        child: Text('저장하기'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
