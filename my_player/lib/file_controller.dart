import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileController {
  FileController._();
  static late Directory _appDocumentsDirectory;
  Future<void> init() async {
    _appDocumentsDirectory = await getApplicationDocumentsDirectory();
    _appDocumentsDirectory = Directory('/asjdlfkj/asdlfkjalsdjf');
  }

  Future<void> writeFile() async {
    final file = File(
        '${_appDocumentsDirectory.path}/${DateTime.now().toString().substring(0, 10)}.txt');
    if (await file.exists()) {
      String prevData = await file.readAsString();
      String newData = '${DateTime.now().intoStr()} this is new data\n';
      file.writeAsString('$prevData$newData');
    } else {
      file.writeAsString('this is new data\n');
    }
  }

  Future<void> deleteStale() async {
    final toDelete = File('${_appDocumentsDirectory}/stalefile.txt');
    try {
      await toDelete.delete();
    } catch (e) {
      print(e);
    }
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

extension format on DateTime {
  String intoStr() {
    return '0$year-${month.intoTwoDigit()}-${day.intoTwoDigit()} ${hour.intoTwoDigit()}:${minute.intoTwoDigit()}:${second.intoTwoDigit()}';
  }
}

// format : YYYY-MM-DD HH:MM:SS 