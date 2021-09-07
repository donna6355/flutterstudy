import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  static const List<String> titles = ['ontop', 'pretty', 'yawn', 'zzz'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo List'),
      ),
      body: Container(
          // color: Colors.blue,
          padding: EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: titles.length,
            itemBuilder: (BuildContext context, int idx) {
              return InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.blue,
                  child: Text(
                    titles[idx],
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
