import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLOC HOME')),
      body: Column(children: [
        const Text('COUNTER : '),
        Text(''),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Decrement'),
            ),
          ],
        )
      ]),
    );
  }
}
