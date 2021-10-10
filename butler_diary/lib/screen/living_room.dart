import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widget/drawer_profile.dart';
import '../model/profile.dart';

class LivingRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerProfile(),
      appBar: AppBar(
        title: Text('집사 다이어리'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/profile_edit');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box('myCat').listenable(),
          builder: (context, box, widget) {
            return ListView.builder(
              itemBuilder: (context, idx) {
                final Profile profile = box.getAt(idx);
                return Text(profile.name);
              },
              itemCount: box.length,
            );
          }),
    );
  }
}
