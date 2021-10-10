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
          Expanded(
            child: ValueListenableBuilder<Box>(
                valueListenable: Hive.box('myCat').listenable(),
                builder: (context, box, widget) {
                  return ListView.builder(
                    itemBuilder: (context, idx) {
                      final Profile profile = box.getAt(idx);
                      return TextButton(
                          onPressed: () {}, child: Text(profile.name));
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
