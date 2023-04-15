import 'package:flutter/material.dart';
import 'package:serial_port_win32/serial_port_win32.dart';

class SerialTest extends StatefulWidget {
  const SerialTest({super.key});

  @override
  State<SerialTest> createState() => _SerialTestState();
}

class _SerialTestState extends State<SerialTest> {
  late SerialPort _port;

  @override
  void initState() {
    super.initState();
    _port = SerialPort("COM3");
    if (_port.isOpened) _port.close();
    _port.openWithSettings(BaudRate: 38400);
    _port.close();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
