import 'package:flutter/material.dart';
import '../model/profile.dart';

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
        Navigator.of(context).pushNamed(
          '/diary',
          arguments: profile,
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
        height: 200,
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Center(child: Image.asset('asset/img/basic.jpeg')),
              width: MediaQuery.of(context).size.width / 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  profile.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(profile.gender == 1 ? '남자아이' : '여자아이'),
                SizedBox(height: 5),
                Text(
                    '${profile.birth.year}년 ${profile.birth.month}월 ${profile.birth.day}일'),
                Text(
                  ageCalc(profile.birth),
                ),
                SizedBox(height: 5),
                if (profile.weight != null) Text('${profile.weight}kg'),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff454442)),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
