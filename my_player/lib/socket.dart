import 'dart:io';
import './shared_preferences.dart';

class TCP {
  Socket? clientSocekt;
  String globalTest = 'asdf';
  static String _seqNo = Preferences.tcpSequence.intoFourDigit();
  static String _machineId = Preferences.machineId;

  Future<bool> init(Socket clientSocekt) async {
    try {
      clientSocekt.listen((evt) {
        print(evt);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  String handleRes(String res) {
    if (res != 'OK') return _seqNo;

    switch (globalTest) {
      case 'asdf':
        globalTest = 'diff';
        break;
      default:
        break;
    }
    return _machineId;
  }
}

extension SetDigit on int {
  String intoTwoDigit() {
    return toString().padLeft(2, '0');
  }

  String intoFourDigit() {
    return toString().padLeft(4, '0');
  }
}
