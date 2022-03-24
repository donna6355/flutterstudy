import 'package:flutter/material.dart';

class SliverTutorial extends StatelessWidget {
  const SliverTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.amber,
            title: Text('This Appbar is not visible'),
            expandedHeight: 30,
            collapsedHeight: 150,
          ),
          const SliverAppBar(
            backgroundColor: Colors.green,
            title: Text('Have a nice day'),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(15),
                  child: Container(
                    color: Colors.blue[100 * (index % 9 + 1)],
                    height: 80,
                    alignment: Alignment.center,
                    child: Text(
                      "Item ${index + 1}",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
