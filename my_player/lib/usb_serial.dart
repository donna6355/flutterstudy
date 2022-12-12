import 'dart:typed_data';

import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';
// https://pub.dev/packages/usb_serial

class SerialUsb {
  static UsbPort? port;
  static late Transaction<Uint8List> transaction;

  static Future<void> init() async {
    port = await UsbSerial.create(1027, 24577);
    if (port == null) return;
    if (await (port!.open()) != true) return;

    await port!.setDTR(true);
    await port!.setRTS(true);
    await port!.setPortParameters(
        9600, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);
    transaction = Transaction.terminated(
        port!.inputStream as Stream<Uint8List>, Uint8List.fromList([3]));
  }

  static Stream<Uint8List> fetchMachineStream() {
    return transaction.stream;
  }

  static void terminateMachinePort() {
    transaction.dispose();
    port!.close();
  }
}
