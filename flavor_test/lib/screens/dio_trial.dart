import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioTrial extends StatefulWidget {
  const DioTrial({Key? key}) : super(key: key);

  @override
  State<DioTrial> createState() => _DioTrialState();
}

class _DioTrialState extends State<DioTrial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DIO TRIAL')),
      body: Column(children: [
        ElevatedButton(onPressed: () {}, child: const Text('click to req'))
      ]),
    );
  }
}
