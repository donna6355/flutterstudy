import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class SerialBarcode {
  static final SerialBarcode _instance = SerialBarcode._();
  static late SerialPort? _barcodePort;
  static late SerialPortReader _barcodeReader;
  static String _combine = '';
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
      });
      return true;
    }
  }

  static void closeBarcodePort() {
    _barcodeReader.close();
    _barcodePort!.close();
  }
}
