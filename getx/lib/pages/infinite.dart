import 'package:flutter/material.dart';

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
                      title: Text(items[idx]),
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
