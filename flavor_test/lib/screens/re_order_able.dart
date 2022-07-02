import 'package:flutter/material.dart';

class ReOrderAble extends StatefulWidget {
  const ReOrderAble({Key? key}) : super(key: key);

  @override
  State<ReOrderAble> createState() => _ReOrderAbleState();
}

class _ReOrderAbleState extends State<ReOrderAble> {
  final List<String> _list = [
    'hello',
    'how',
    'are',
    'you',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        children: _list
            .map((item) => ListTile(
                  key: Key("${item}"),
                  title: Text("${item}"),
                  trailing: Icon(Icons.menu),
                ))
            .toList(),
        onReorder: (int start, int current) {
          // dragging from top to bottom
          if (start < current) {
            int end = current - 1;
            String startItem = _list[start];
            int i = 0;
            int local = start;
            do {
              _list[local] = _list[++local];
              i++;
            } while (i < end - start);
            _list[end] = startItem;
          }
          // dragging from bottom to top
          else if (start > current) {
            String startItem = _list[start];
            for (int i = start; i > current; i--) {
              _list[i] = _list[i - 1];
            }
            _list[current] = startItem;
          }
          setState(() {});
        },
      ),
    );
  }
}
