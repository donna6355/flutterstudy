import 'package:flutter/material.dart';
// import 'dart:convert' show utf8;
import 'dart:math' as math;

class Infinite extends StatefulWidget {
  const Infinite({Key? key}) : super(key: key);

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

    // initState is overlapped during build method n thats the reason why this error occurs;
    // fluttererror (setstate() or markneedsbuild() called during build. this getbuilder<searchcontroller> widget cannot be marked as needing to build because the framework is already in the process of building widgets. a widget can be marked as needing to be built during the build phase only if one of its ancestors is currently building. this exception is allowed because the framework builds parent widgets before children, which means a dirty descendant will always be built. otherwise, the framework might not visit this widget during this build phase. the widget on which setstate() or markneedsbuild() was called was: getbuilder<searchcontroller> the widget which was currently being built when the offending call was made was: builder
    // Future.delayed(Duration.zero,(){});

    //you are not allowed to add async modifier to initState
    // Future.delayed(Duration.zero,() async {
    //       //your async 'await' codes goes here
    // });

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
              Scrollbar(
                child: ListView.separated(
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
                      return const Divider(height: 1);
                    },
                    itemCount: items.length),
              ),
              if (loading)
                Positioned(
                    bottom: 16,
                    child: SizedBox(
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
