import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('프로필'),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '이름',
              ),
            ),
            Row(
              children: [
                Text('성별'),
                SizedBox(width: 20),
                Row(
                  children: [
                    Radio(
                      activeColor: Color(0xff454442),
                      value: 1,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value as int;
                        });
                      },
                    ),
                    Text('남자아이')
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Radio(
                      activeColor: Color(0xff454442),
                      value: 2,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value as int;
                        });
                      },
                    ),
                    Text('여자아이')
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text('생일'),
                SizedBox(width: 20),
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
                  icon: Icon(Icons.calendar_today_outlined),
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '몸무게 (kg)',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '기타',
              ),
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
