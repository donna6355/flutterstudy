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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Counter(
          key: counterKey,
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
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
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
