import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  double height = 0;
  // bool layoutVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 100),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  // layoutVisible = !layoutVisible;
                  height = height == 200 ? 0 : 200;
                });
              },
              child: const Text('test')),
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            height: height,
            color: Colors.teal,
            child: Text('hmmmm'),
          )
        ],
      ),
    );
  }
}
