import 'package:flutter/material.dart';
import '../model/profile.dart';

class ProfileScr extends StatelessWidget {
  final Profile profile;
  ProfileScr(this.profile);

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(
                '/diary',
                arguments: profile.name,
              );
            },
            icon: Icon(Icons.calendar_today_outlined),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(40),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                child: Text('img for cat'),
              ),
            ),
            SizedBox(height: 10),
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
                Text(profile.name),
              ],
            ),
            SizedBox(height: 10),
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
                    '${profile.birth.year}년 ${profile.birth.month}월 ${profile.birth.day}일${ageCalc(profile.birth)}'),
              ],
            ),
            SizedBox(height: 10),
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
                Text(profile.gender == 1 ? '남자아이' : '여자아이'),
              ],
            ),
            SizedBox(height: 10),
            Row(
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
                Text(profile.weight == null
                    ? '몰라용;;'
                    : '${profile.weight.toString()} kg'),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    '기타',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Text(profile.remark!),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff454442),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text('수정하기'),
            // ),
          ],
        ),
      ),
    );
  }
}
