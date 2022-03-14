// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SubList extends StatefulWidget {
  const SubList({Key? key}) : super(key: key);

  @override
  State<SubList> createState() => _SubListState();
}

class _SubListState extends State<SubList> {
  int? num = 4;
  List<String> fruits = [
    'banana',
    'apple',
    'pear',
    'strawberry',
    'orange',
    'mandarine',
    'melon',
    'mango',
    'tomato',
    'watermelon'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            ...fruits.sublist(0, num).map((fruit) => Text(fruit)),
            ActionChip(
                label: const Text('more'),
                onPressed: () {
                  setState(() {
                    if (fruits.length > num! + 4) {
                      num = num! + 4;
                    } else {
                      num = null;
                    }
                  });
                }),
          ],
        ),
      ),
    );
  }
}

// List<E> sublist(int start, [int? end]);
