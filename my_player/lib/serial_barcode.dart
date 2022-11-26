import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class SerialBarcode {
  static final SerialBarcode _instance = SerialBarcode._();
  static late SerialPort _barcodePort;
  static late SerialPortReader _barcodeReader;
  static late Stream _barcodeStream;
  static String _combine = '';
  SerialBarcode._() {
    try {
      ///dev/cu.usbmodemG21L081421 // digimarc for mac
      _barcodePort = SerialPort(
          SerialPort.availablePorts.last); //for mac Port name keep changing
      // _barcodePort = SerialPort("COM3"); //for windows
      _barcodePort.flush();
      _barcodeReader = SerialPortReader(_barcodePort);
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
      _barcodePort.close();
      return false;
    } else {
      _barcodeStream = _barcodeReader.stream.asBroadcastStream();
      _barcodeStream.listen((data) {
        print(data);

        /// [Uint8] is not constructible in the Dart code and serves purely as marker in
        /// type signatures.
        /// Uint8 [10] is etx! if list has etx, convert to string!

        final String converted = String.fromCharCodes(data);
        _combine = _combine + converted;
        if (data.last == 10) {
          print(_combine);
          _combine = '';
        }
      });
      return true;
    }
  }

  static Stream test() {
    if (!_barcodePort!.openRead()) {
      return Stream.error('failed to read...');
    } else {
      return _barcodeStream;
    }
  }

  static void closeBarcodePort() {
    _barcodePort.flush();
    _barcodeReader.close();
    _barcodePort.close();
  }
}
