// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, file_names,prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false, //fix position of appbar
            floating: true, // visible every slide up
            // snap: true, // every slide up this flexible space will be visible
            // expandedHeight: 100,
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text('hello'),
            //   centerTitle: true,
            // ),
            title: Text('SLIVERAPPBAR'),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Text(
                'ISSAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.black26,
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.teal,
              ),
              ExpansionTile(
                title: Text('see more'),
                children: const [
                  ListTile(title: Text('tile 1')),
                  ListTile(title: Text('tile 2')),
                  ListTile(title: Text('tile 3')),
                  ListTile(title: Text('tile 4')),
                  ListTile(title: Text('tile 5')),
                  ListTile(title: Text('tile 6')),
                ],
              ),
              Tooltip(
                message: 'hello',
                child: Icon(
                  Icons.smart_toy,
                  size: 100,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
