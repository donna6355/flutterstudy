// ignore_for_file: file_names, prefer_final_fields
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StepperTest extends StatefulWidget {
  const StepperTest({Key? key}) : super(key: key);

  @override
  _StepperTestState createState() => _StepperTestState();
}

class _StepperTestState extends State<StepperTest> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stepper')),
      body: Center(
          child: Stepper(
        currentStep: _currentStep,
        onStepTapped: (newIdx) {
          setState(() {
            _currentStep = newIdx;
          });
        },
        onStepCancel: () {
          if (_currentStep != 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_currentStep != 2) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        steps: const [
          Step(
            title: Text('Step 1'),
            content: Text('Content for what?'),
          ),
          Step(
            title: Text('Step 2'),
            content: Text('Content for what?'),
          ),
          Step(
            title: Text('Step 3'),
            content: Text('Content for what?'),
          ),
        ],
      )),
    );
  }
}
