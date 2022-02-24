// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TabTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 4,
                    color: Colors.teal,
                  ),
                ),
                // indicatorColor: Colors.teal,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.tag_faces), text: '메뉴1'),
                  Tab(icon: Icon(Icons.add_circle_sharp), text: '메뉴2'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: <Widget>[
                Container(
                  color: Colors.yellow,
                  child: Text('Greetings from S.Korea'),
                ),
                Container(
                  color: Colors.orange,
                  child: FittedBox(
                    child: Text('Greetings from S.Korea'),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
