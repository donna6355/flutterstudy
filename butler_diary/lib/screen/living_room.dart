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
        margin: EdgeInsets.all(20),
        child: ValueListenableBuilder<Box>(
            valueListenable: Hive.box('myCats').listenable(),
            builder: (context, box, widget) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: box.length,
                  itemBuilder: (BuildContext ctx, idx) {
                    final Profile profile = box.getAt(idx);
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/diary',
                          arguments: profile,
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(profile.name),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff454442)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
