import 'package:flutter/material.dart';

class DrawerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Text('냥님1'),
          Text('냥님2'),
          Text('냥님3'),
          Text('이용 안내'),
          Text('개발자 메시지'),
        ],
      ),
    );
  }
}
