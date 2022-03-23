import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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


// There's almost no difference.
// ListView is a SliverList. Same with GridView, which is a SliverGrid.
// They are doing exactly the same thing. The only difference between them is that SliverList is a sliver, not a widget. Which means it's used inside a ScrollView, usually CustomScrollView.
// ListView is nothing else but a biding of SliverList to transform it into a Widget to make it usable alongside other widgets such as Row/Container.

// flutter build apk --release --target-platform=android-arm64