// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabTest extends StatefulWidget {
  @override
  State<TabTest> createState() => _TabTestState();
}

class _TabTestState extends State<TabTest> with SingleTickerProviderStateMixin {
  AnimationController? _myAnimation;
  bool _switch = false;

  @override
  void initState() {
    super.initState();
    _myAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
  }

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
                  child: Column(
                    children: [
                      const Text('Greetings from S.Korea'),
                      Center(
                        child: InkWell(
                          onTap: () {
                            if (_myAnimation!.isCompleted) {
                              _myAnimation!.reverse();
                            } else {
                              _myAnimation!.forward();
                            }
                          },
                          child: AnimatedIcon(
                            size: 50,
                            color: Colors.teal,
                            icon: AnimatedIcons.pause_play,
                            progress: _myAnimation!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Column(
                    children: [
                      const FittedBox(
                        child: Text('Greetings from S.Korea'),
                      ),
                      const Spacer(), //default one
                      const Flexible(child: Text('hmm flexible')),
                      Transform.scale(
                        scale: 0.7,
                        child: CupertinoSwitch(
                          activeColor: Colors.red,
                          value: _switch,
                          onChanged: (val) {
                            setState(() {
                              _switch = val;
                            });
                          },
                        ),
                      ),
                      //better to use transform.scale to adjust the size of cupertino switch
                      // Container(
                      //   width: 70,
                      //   height: 20,
                      //   color: Colors.white,
                      //   child: FittedBox(
                      //     child: CupertinoSwitch(
                      //       activeColor: Colors.red,
                      //       value: _switch,
                      //       onChanged: (val) {
                      //         setState(() {
                      //           _switch = val;
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
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
