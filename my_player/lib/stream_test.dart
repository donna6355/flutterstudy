import 'package:flutter/material.dart';
import 'package:my_player/serial_barcode.dart';

class StreamTest extends StatefulWidget {
  const StreamTest({super.key});

  @override
  State<StreamTest> createState() => _StreamTestState();
}

class _StreamTestState extends State<StreamTest> {
  Stream? test;
  String label = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test = SerialBarcode.test();
    test!.listen((event) {
      setState(() {
        label = event.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        StreamBuilder(
          builder: (_, snapshot) {
            return Text(snapshot.data.toString());
          },
          stream: test,
        )
      ],
    );
  }
}
