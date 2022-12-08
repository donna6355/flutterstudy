import 'dart:typed_data';

import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';
// https://pub.dev/packages/usb_serial

class SerialUsb {
  static UsbPort? port;
  static late Transaction<String> transaction;

  static Future<void> init() async {
    port = await UsbSerial.create(1027, 24577);
    if (port == null) return;
    port!.open();

    await port!.setDTR(true);
    await port!.setRTS(true);
    await port!.setPortParameters(
        115200, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);
    transaction = Transaction.stringTerminated(
        port!.inputStream as Stream<Uint8List>, Uint8List.fromList([13, 10]));
  }
}
