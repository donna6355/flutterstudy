import 'package:flutter/material.dart';
import '../widget/drawer_profile.dart';

class ProfileEditScr extends StatefulWidget {
  @override
  _ProfileEditScrState createState() => _ProfileEditScrState();
}

class _ProfileEditScrState extends State<ProfileEditScr> {
  String name = '';
  DateTime? birth;
  int gender = -1;
  double? weight;
  String remarks = '';

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
      drawer: DrawerProfile(),
      appBar: AppBar(
        title: Text('프로필'),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Text('img for cat'),
                ),
              ],
            ),
            SizedBox(height: 10),
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
                    maxLength: 10,
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
                          setState(() {
                            gender = value as int;
                          });
                        },
                      ),
                    ),
                    Text('남자아이')
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
                          setState(() {
                            gender = value as int;
                          });
                        },
                      ),
                    ),
                    Text('여자아이')
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
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now())
                        .then((pickedDate) {
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
              maxLines: 2,
              maxLength: 100,
              decoration: InputDecoration(
                hintText: 'ex) 빈 땅콩',
                counterText: '',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('저장하기'),
            ),
          ],
        ),
      ),
    );
  }
}
