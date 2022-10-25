import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class SerialBarcode {
  static final SerialBarcode _instance = SerialBarcode._();
  static late SerialPort? _barcodePort;
  static late SerialPortReader _barcodeReader;
  static List<int> _combine = [];
  SerialBarcode._() {
    try {
      ///dev/cu.usbmodemG21L081421 // digimarc for mac
      _barcodePort = SerialPort(
          SerialPort.availablePorts.last); //for mac Port name keep changing
      // _barcodePort = SerialPort("COM3"); //for windows

      _barcodeReader = SerialPortReader(_barcodePort!);
    } catch (e) {
      print(e);
    }
  }

  factory SerialBarcode() {
    return _instance;
  }

  static bool readBarcodeStream(BuildContext context, int mode) {
    // MODE!! 0: admin, 1: user
    if (_barcodePort == null || !_barcodePort!.openRead()) {
      _barcodePort?.close();
      return false;
    } else {
      _barcodeReader.stream.listen((data) {
        print(data);

        /// [Uint8] is not constructible in the Dart code and serves purely as marker in
        /// type signatures.
        /// Uint8 10 is etx!
        _combine.addAll(data);
        if (_combine.last == 10) {
          print(_combine);
          _combine = [];
        }
      });
      return true;
    }
  }

  static void closeBarcodePort() {
    _barcodeReader.close();
    _barcodePort!.close();
  }
}
