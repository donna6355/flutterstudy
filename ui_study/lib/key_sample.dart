// keys are required for modifying widgets only if they are stateful. Stateless widgets don't require them.
// https://medium.com/codingmountain-blog/keys-in-flutter-f2d1af673c86

import 'package:flutter/material.dart';

class PositionTiles extends StatefulWidget {
  const PositionTiles({Key? key}) : super(key: key);
  @override
  State<PositionTiles> createState() => _PositionTilesState();
}

class _PositionTilesState extends State<PositionTiles> {
  List<Widget> tiles = [];
  @override
  void initState() {
    super.initState();
    tiles = [
      StatelessColorTiles(),
      StatelessColorTiles(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.sentiment_very_satisfied,
        ),
        onPressed: swapTiles,
      ),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorTiles extends StatelessWidget {
  Color myColor = Colors.black38;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: myColor,
    );
  }
}

class PositionTilesTwo extends StatefulWidget {
  const PositionTilesTwo({Key? key}) : super(key: key);
  @override
  State<PositionTilesTwo> createState() => _PositionTilesTwoState();
}

class _PositionTilesTwoState extends State<PositionTilesTwo> {
  List<Widget> tiles = [];
  @override
  void initState() {
    super.initState();
    tiles = [
      StatefulColorTiles(
        key: UniqueKey(),
      ),
      StatefulColorTiles(
        key: UniqueKey(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.sentiment_very_satisfied,
        ),
        onPressed: swapTiles,
      ),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatefulColorTiles extends StatefulWidget {
  const StatefulColorTiles({Key? key}) : super(key: key);
  @override
  State<StatefulColorTiles> createState() => _StatefulColorTilesState();
}

class _StatefulColorTilesState extends State<StatefulColorTiles> {
  late Color myColor;
  @override
  void initState() {
    super.initState();
    myColor = Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: myColor,
    );
  }
}
