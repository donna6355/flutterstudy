import 'dart:io';

import 'package:flutter/material.dart';
// import './shared_preferences.dart';

const Map<String, String> _testMap = {
  'asdf': 'asdf',
  'qwer': 'qwer',
};

enum Constants {
  asdf,
  qwer,
  test;
}

const Map<int, int> _id = {
  1: 0x31,
  2: 0x32,
  3: 0x33,
  4: 0x34,
  5: 0x35,
};

class TCP {
  Socket? clientSocekt;
  String globalTest = Constants.asdf.name;
  static String _seqNo = Constants.qwer.name; //put mockup val
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

  String handleNmjs(String res, BuildContext ctx) {
    return res;
  }

  String handleRes(String res) {
    if (res != 'OK') return _seqNo;
    //switch to map

    // switch (globalTest) {
    //   case 'asdf':
    //     return 'asdf';
    //   default:
    //     break;
    // }
    return _testMap[globalTest] ?? _machineId;
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
    List<int> _cmd =
        [0x02] + [_id[1] ?? 0x31] + [0x31, 0x30] + [0x31, 0x00, 0x03];
    // exclusive or!
    _cmd[6] = _cmd[0] ^ _cmd[1] ^ _cmd[2] ^ _cmd[3] ^ _cmd[4] ^ _cmd[5];
  }
}
