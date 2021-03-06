import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  double height = 0;
  bool layoutVisible = false;
  final GlobalKey _redBoxKey = GlobalKey();

  // _getSize(GlobalKey key) {
  //   if (key.currentContext != null) {
  //     final RenderBox renderBox =
  //         key.currentContext!.findRenderObject() as RenderBox;
  //     Size size = renderBox.size;
  //     return size.height;
  //   }
  // }

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
                  layoutVisible = !layoutVisible;
                  // height = _getSize(_redBoxKey);
                  height = 300;
                });
              },
              child: const Text('test')),
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            height: height,
            color: Colors.teal,
            child: Container(
              key: _redBoxKey,
              height:
                  400, // this height is ignored and AnimatedContainer's height is superior.
              width: 40,
              color: Colors.red,
            ),
          )
          // if (layoutVisible)
          //   LayoutBuilder(
          //     builder: (BuildContext context, BoxConstraints constraints) {
          //       // setState(() {
          //       //   height = constraints.maxHeight;
          //       // });
          //       return AnimatedContainer(
          //         duration: const Duration(milliseconds: 600),
          //         height: height,
          //         child: Text(
          //           constraints.maxHeight.toString(),
          //         ),
          //       );
          //     },
          //   ),
        ],
      ),
    );
  }
}
