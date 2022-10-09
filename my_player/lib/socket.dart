import 'dart:io';

class TCP {
  Socket? clientSocekt;
  String globalTest = 'asdf';

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
    if (res != 'OK') return '';
    String test = '';

    switch (globalTest) {
      case 'asdf':
        test = 'this is asdf';
        globalTest = 'diff';
        break;
      default:
        break;
    }
    return test;
  }
}
