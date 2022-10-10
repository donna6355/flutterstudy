import 'dart:io';
// import './shared_preferences.dart';

class TCP {
  Socket? clientSocekt;
  String globalTest = 'asdf';
  static String _seqNo = '0001'; //put mockup val
  static String _machineId = '0000';

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
        return 'asdf';
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
