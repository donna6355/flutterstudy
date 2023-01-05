// https://booiljung.github.io/technical_articles/flutter/state_management/architecture_your_flutter_project_using_bloc_pattern.html

import 'package:flutter/material.dart';
import './app.dart';

void main() {
  runApp(App());
}

// https://api.flutter.dev/flutter/widgets/GlobalKey-class.html

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  final counterKey = GlobalKey<_CounterState>();
  // final testKey = GlobalKey(); only for statefulWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Counter(
              key: counterKey,
            ),
            // Testless(testKey)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterKey.currentState!.increment();
          print(counterKey.currentState!.count);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() =>
      _CounterState(); //if the child widget is in separate file, do need to change state name without underscore!
}

class _CounterState extends State<Counter> {
  int count =
      0; // state also has to be non-local variable for access from outside
  @override
  Widget build(BuildContext context) {
    return Text('$count');
  }

  void increment() {
    setState(() {
      count++;
    });
  }
}

class Testless extends StatelessWidget {
  const Testless({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
