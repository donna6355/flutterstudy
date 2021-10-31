import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/profile.dart';
import '../screen/living_room.dart';

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
                  fontSize: 20,
                ),
              )),
          Expanded(
            child: ValueListenableBuilder<Box>(
                valueListenable: Hive.box('myCats').listenable(),
                builder: (context, box, widget) {
                  if (box.length == 0)
                    return Column(
                      children: [
                        Image.asset('asset/img/drawer.png'), // need to change
                        Text('나만 고양이 없어....'),
                        Text('주인님이 입양이 시급합니다.'),
                      ],
                    );
                  return ListView.builder(
                    itemBuilder: (context, idx) {
                      final Profile profile = box.getAt(idx);

                      Future<void> _removeProfile() async {
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('${profile.name} 프로필 지우기'),
                              content: SingleChildScrollView(
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
                                    Hive.deleteBoxFromDisk(
                                        'diary_${profile.id}');
                                    box.delete(profile.id);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              LivingRoom()),
                                      ModalRoute.withName('/'),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }

                      return Container(
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).popAndPushNamed(
                                  '/profile',
                                  arguments: profile,
                                );
                              },
                              child: Container(
                                width: 80,
                                child: Text(
                                  profile.name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: _removeProfile,
                              icon: Icon(
                                Icons.cancel,
                                size: 15,
                                color: Color(0xff454442),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: box.length,
                  );
                }),
          ),
          // TextButton(
          //   onPressed: () {},
          //   child: Text('이용 안내'),
          // ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/message',
              );
            },
            child: Text('개발자 메시지'),
          ),
        ],
      ),
    );
  }
}
