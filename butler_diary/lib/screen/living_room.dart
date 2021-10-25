import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widget/drawer_profile.dart';
import '../widget/profile_card.dart';
import '../model/profile.dart';

class LivingRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerProfile(),
      appBar: AppBar(
        elevation: 0,
        title: Text('집사 다이어리'),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/profile_edit');
                  },
                  icon: Icon(Icons.add),
                ),
              ),
              Text(
                '냥줍',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<Box>(
                  valueListenable: Hive.box('myCats').listenable(),
                  builder: (context, box, widget) {
                    return ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (BuildContext ctx, idx) {
                          final Profile profile = box.getAt(idx);
                          return ProfileCard(profile);
                        });
                  }),
            ),
            Container(
              color: Colors.grey[600],
              child: Text('banner pos'),
              width: double.infinity,
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
