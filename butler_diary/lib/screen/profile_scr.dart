import 'package:flutter/material.dart';
import '../widget/drawer_profile.dart';

class ProfileScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerProfile(),
      appBar: AppBar(
        title: Text('프로필'),
      ),
      body: Column(
        children: [
          Text('이름'),
          Text('생일'),
          Text('성별'),
          Text('몸무게'),
          Text('기타'),
          ElevatedButton(
            onPressed: () {},
            child: Text('수정하기'),
          ),
        ],
      ),
    );
  }
}
