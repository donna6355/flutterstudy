import 'dart:typed_data';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import './log_data.dart';

class SerialBoard {
  static late SerialPort _boardPort;
  static late SerialPortReader _boardReader;
  SerialBoard._();

  static dynamic init() {
    try {
      // _boardPort = SerialPort(SerialPort.availablePorts.last); //for mac Port
      _boardPort = SerialPort("COM7"); //for windows

      _boardPort.config.baudRate = 38400;
      _boardPort.config.stopBits = 1;
      _boardPort.config.bits = 8;

      _boardReader = SerialPortReader(_boardPort);
      return true;
    } catch (e) {
      return e;
    }
  }

  static Stream<Uint8List>? readBoardStream() {
    if (!_boardPort.openReadWrite()) {
      _boardPort.close();
      return null;
    } else {
      return _boardReader.stream;
    }
  }

  static void wirteBoard(List<int> cmd) {
    try {
      _boardPort.write(Uint8List.fromList(cmd));
    } catch (e) {
      LogController.writeLog(
        level: LogLevel.pcb,
        tag: LogTag.err,
        msg: e.toString(),
        writeFile: true,
      );
    }
  }

  static void closeBoard() {
    _boardReader.close();
    _boardPort.close();
  }
}
