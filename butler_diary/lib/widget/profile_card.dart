import 'package:flutter/material.dart';
import '../model/profile.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import '../provider/my-selected-date.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  ProfileCard(this.profile);

  String ageCalc(DateTime birth) {
    DateTime now = DateTime.now();

    int years = now.year - birth.year;
    int months = now.month - birth.month;
    int days = now.day - birth.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += (days < 0 ? 11 : 12);
    }

    return years > 0 ? '/ $years년 $months개월' : '/ $months개월';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<MySelectedDate>(context, listen: false).updateSelectedDate(
          DateTime.now(),
          DateTime.now(),
        );
        Provider.of<MySelectedDate>(context, listen: false).resetFormat();
        Navigator.of(context).pushNamed(
          '/diary',
          arguments: profile,
        );
        // gotta reset provider in now and week
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
        padding: EdgeInsets.all(5),
        height: 200,
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Center(
                  child: Image.asset(
                      'asset/img/${profile.photo}${new Random().nextInt(5)}.png')),
              width: MediaQuery.of(context).size.width / 2,
              // decoration: BoxDecoration(
              //   border: Border(
              //     right: BorderSide(width: 1.0, color: Color(0xffa0a099)),
              //   ),
              // ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    profile.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(profile.gender == 1 ? '남자아이' : '여자아이'),
                  SizedBox(height: 5),
                  Text(
                      '${profile.birth.year}년 ${profile.birth.month}월 ${profile.birth.day}일'),
                  Text(
                    ageCalc(profile.birth),
                  ),
                  SizedBox(height: 5),
                  if (profile.weight != null) Text('${profile.weight}kg'),
                  SizedBox(height: 5),
                  if (profile.remark != null)
                    Text(
                      profile.remark!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff454442)),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
