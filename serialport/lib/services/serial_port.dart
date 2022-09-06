import 'package:flutter_libserialport/flutter_libserialport.dart';

class Port {
  static final Port _instance = Port._();
  static late SerialPort _barcodePort;
  static late SerialPortReader _barcodeReader;

  // async cannot be applied to construcor...
  // in case async initializer required... how should I handle?
  //reference
  //https://medium.com/flutter-seoul/dart%EC%97%90%EC%84%9C-singleton-pattern%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0-2312616bbb7e
  //https://daldalhanstory.tistory.com/240
  Port._() {
    _barcodePort = SerialPort(SerialPort.availablePorts.last);

    //baudRate = 115200; bits = 8; stopBits = 1;

    _barcodeReader = SerialPortReader(_barcodePort);
  }

  factory Port() {
    return _instance;
  }

  void readBarcodeStream() {
    if (!_barcodePort.openReadWrite()) {
      _barcodePort.close();
    } else {
      _barcodeReader.stream.listen((data) {
        print(data);
        _barcodeReader.close();
      });
    }
  }
}
