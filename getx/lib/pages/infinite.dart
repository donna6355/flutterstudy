import 'package:flutter/material.dart';

class Infinite extends StatefulWidget {
  @override
  State<Infinite> createState() => _InfiniteState();
}

class _InfiniteState extends State<Infinite> {
  List<String> items = [];
  bool loading = false;
  bool allLoaded = false;

  Future<void> mockfecth() async {
    if (allLoaded) return;
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    List<String> newData = items.length >= 60
        ? []
        : List.generate(20, (index) => 'List Item ${index + items.length}');
    if (newData.isNotEmpty) items.addAll(newData);
    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    mockfecth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INFINITE SCROLL'),
      ),
      body: LayoutBuilder(builder: (ctx, constraints) {
        if (items.isNotEmpty) {
          return ListView.separated(
              itemBuilder: (ctx, idx) {
                return ListTile(
                  title: Text(items[idx]),
                );
              },
              separatorBuilder: (ctx, idx) {
                return Divider(height: 1);
              },
              itemCount: items.length);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
