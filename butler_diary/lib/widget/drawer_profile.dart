import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/profile.dart';

class DrawerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                top: 40,
              ),
              padding: EdgeInsets.only(
                left: 10,
              ),
              width: double.infinity,
              child: Text(
                '주인님 프로필 수정하기',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
          Expanded(
            child: ValueListenableBuilder<Box>(
                valueListenable: Hive.box('myCats').listenable(),
                builder: (context, box, widget) {
                  return ListView.builder(
                    itemBuilder: (context, idx) {
                      final Profile profile = box.getAt(idx);
                      return Container(
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).popAndPushNamed(
                                '/profile',
                                arguments: profile,
                              );
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                profile.name,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )),
                      );
                    },
                    itemCount: box.length,
                  );
                }),
          ),
          TextButton(
            onPressed: () {},
            child: Text('이용 안내'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('개발자 메시지'),
          ),
        ],
      ),
    );
  }
}
