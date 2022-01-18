// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/getxControl.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String sample = '';
  // final textCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      sample = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            onChanged: (val) {
              print(val);
              setState(() {
                sample = val;
              });
            },
            // controller: textCtrl,
          ),
          ElevatedButton(
            onPressed: () {
              // print(textCtrl.text);
            },
            child: const Text('submit'),
          ),
        ],
      ),
    );
  }
}
