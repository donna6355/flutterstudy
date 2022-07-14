import 'package:flutter/material.dart';

class MapTest extends StatefulWidget {
  const MapTest({Key? key}) : super(key: key);

  @override
  State<MapTest> createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
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
  final Map<String, dynamic> computed = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [],
      ),
    );
  }

  Widget _sessionCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(data['machineId']),
          Text(data['time']),
          Text(data['location']),
        ],
      ),
    );
  }
}
