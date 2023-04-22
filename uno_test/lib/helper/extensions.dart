import 'dart:ffi';
import 'package:ffi/ffi.dart';

extension TimeFormat on DateTime {
  String forLogData() {
    return toString().substring(0, 19);
  }

  String forPic() {
    return toString().substring(0, 19).replaceAll(':', '_');
  }

  String forTitle() {
    return toString().substring(0, 10);
  }

  List<String> forClock() {
    return [
      toString().substring(0, 10).replaceAll('-', '.'),
      hour < 12 ? 'AM' : 'PM',
      '${(hour < 12 ? hour : hour - 12).toTwoDigit()}:${minute.toTwoDigit()}',
    ];
  }

  String forTcp() {
    return '0$year-${month.toTwoDigit()}-${day.toTwoDigit()} ${hour.toTwoDigit()}:${minute.toTwoDigit()}:${second.toTwoDigit()}';
  }

  int forSes() {
    return (millisecondsSinceEpoch / 1000).round();
  }
}

extension NumFormat on int {
  String toTwoDigit() {
    return toString().padLeft(2, '0');
  }

  String toFourDigit() {
    return toString().padLeft(4, '0');
  }

  String toSixDigit() {
    return toString().padLeft(6, '0');
  }

  String toEightDigit() {
    return toString().padLeft(8, '0');
  }
}

extension Format on String {
  Pointer<Uint8> toPointer() {
    return toNativeUtf8().cast<Uint8>();
  }

  String toFitDigit(int len) {
    return padRight(len, '\$');
  }
}
