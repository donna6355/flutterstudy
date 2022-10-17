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
        print(evt.single);
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

class MainBoard {
  MainBoard._();
  void calculateBCC() {
    List<int> _cmd = [0x02, 0x00, 0x30, 0x31, 0x00, 0x03];
    // exclusive or!
    _cmd.add(_cmd[0] ^ _cmd[1] ^ _cmd[2] ^ _cmd[3] ^ _cmd[4] ^ _cmd[5]);
  }
}
