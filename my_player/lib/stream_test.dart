import 'package:flutter/material.dart';
import 'package:my_player/serial_barcode.dart';

class StreamTest extends StatefulWidget {
  const StreamTest({super.key});

  @override
  State<StreamTest> createState() => _StreamTestState();
}

class _StreamTestState extends State<StreamTest> {
  late Stream test;
  String label = '';
  String _currentCmd = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test = SerialBarcode.test();
    test.listen((event) {
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
            var data = snapshot.data.toString();
            if (data.contains('49 50')) {
              print(data);
            }
            return Text(snapshot.data.toString());
          },
          stream: test,
        )
      ],
    );
  }
}
