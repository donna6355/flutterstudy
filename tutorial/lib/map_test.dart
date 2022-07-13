import 'dart:collection';

import 'package:flutter/material.dart';

class MapTest extends StatefulWidget {
  const MapTest({Key? key}) : super(key: key);

  @override
  State<MapTest> createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  List<Widget> returnVal = [];
  Map<String, List> computedVal = {};
  final List<Map<String, dynamic>> rawData = [
    {
      'machineId': 'alksdjflkajd',
      'time': DateTime(2020, 7, 1, 15, 20),
      'location': 'SEOUL',
    },
    {
      'machineId': 'alksdjflas2d',
      'time': DateTime(2020, 7, 1, 10, 20),
      'location': 'GAYANG',
    },
    {
      'machineId': 'alksdjflas2d',
      'time': DateTime(2020, 7, 1, 12, 20),
      'location': 'GAYANG',
    },
    {
      'machineId': 'alksdjflkajd',
      'time': DateTime(2020, 7, 2, 15, 20),
      'location': 'SEOUL',
    },
    {
      'machineId': 'alksdjflkajd',
      'time': DateTime(2020, 7, 5, 15, 20),
      'location': 'SEOUL',
    },
    {
      'machineId': 'alksdjflkajd',
      'time': DateTime(2020, 7, 4, 15, 20),
      'location': 'SEOUL',
    },
    {
      'machineId': 'wersdjflkajd',
      'time': DateTime(2020, 7, 4, 15, 20),
      'location': 'JEJU',
    },
    {
      'machineId': 'wersdjflkajd',
      'time': DateTime(2020, 7, 7, 19, 20),
      'location': 'JEJU',
    },
  ];
  List<Widget> _computedList = [];

  void _computed() {
    const String keyword = 'machineId';
    for (var data in rawData) {
      if (computedVal[data[keyword]] != null) {
        computedVal[data[keyword]]!.add(data);
      } else {
        computedVal[data[keyword]] = [data];
      }
    }
    print(computedVal);

    final List<String> label = computedVal.keys.toList()
      ..sort((a, b) {
        print(a);
        print(b);
        return a.compareTo(b);
      });

    for (var data in label) {
      returnVal.add(Text(data));
      for (var data in computedVal[data]!) {
        returnVal.add(_sessionCard(data));
      }
    }
    setState(() {
      _computedList = returnVal;
    });
  }

  final Map<String, dynamic> computed = {};
  @override
  Widget build(BuildContext context) {
    _computed();
    return ListView(
      children: _computedList,
    );
  }

  Widget _sessionCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.blue[100],
      child: Column(
        children: [
          Text(
            data['machineId'],
          ),
          Text(
            data['location'],
          ),
          Text(
            data['time'].toString(),
          )
        ],
      ),
    );
  }
}
