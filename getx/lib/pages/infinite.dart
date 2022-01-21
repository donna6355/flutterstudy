import 'package:flutter/material.dart';
import 'dart:convert' show utf8;
import 'dart:math' as math;

class Infinite extends StatefulWidget {
  @override
  State<Infinite> createState() => _InfiniteState();
}

class _InfiniteState extends State<Infinite> {
  final ScrollController _scrollctrl = ScrollController();
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
    _scrollctrl.addListener(() {
      if (_scrollctrl.position.pixels >= _scrollctrl.position.maxScrollExtent &&
          !loading) mockfecth();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollctrl.dispose(); //DO NOT forget to dispose scroll controller!!
  }

  Color strToColor(String str) {
    int hash = 0;
    for (var i = 0; i < str.length; i++) {
      hash = str.codeUnitAt(i) + ((hash << 5) - hash);
    }
    String color = (((math.sin(hash) * 10000) % 1) * 16777216)
        .abs()
        .floor()
        .toRadixString(16);
    return Color(int.parse("0xff$color"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INFINITE SCROLL'),
      ),
      body: LayoutBuilder(builder: (ctx, constraints) {
        if (items.isNotEmpty) {
          return Stack(
            children: [
              ListView.separated(
                  controller: _scrollctrl,
                  itemBuilder: (ctx, idx) {
                    return ListTile(
                      title: Text(
                        items[idx],
                        style: TextStyle(
                          color: strToColor(items[idx]),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, idx) {
                    return Divider(height: 1);
                  },
                  itemCount: items.length),
              if (loading)
                Positioned(
                    bottom: 16,
                    child: Container(
                      width: constraints.maxWidth,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ))
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
