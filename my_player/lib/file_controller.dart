import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileController {
  FileController._();
  static List<FileSystemEntity> files = [];
  static String _appDocumentsDirectory = '';
  Future<void> init() async {
    var origDir = await getApplicationDocumentsDirectory();
    _appDocumentsDirectory =
        origDir.path.substring(0, origDir.path.indexOf('Documents'));
    _appDocumentsDirectory = '${_appDocumentsDirectory}logs';
    if (await Directory(_appDocumentsDirectory).exists() == false) {
      Directory(_appDocumentsDirectory).createSync();
    }
  }

  Future<void> writeFile() async {
    final file = File(
        '$_appDocumentsDirectory/${DateTime.now().toString().substring(0, 10)}.txt');
    if (await file.exists()) {
      String prevData = await file.readAsString();
      String newData = '${DateTime.now().intoStr()} this is new data.\n';
      file.writeAsString('$prevData$newData');
    } else {
      file.writeAsString('this is new data\n');
    }
  }

  Future<void> deleteStale() async {
    //list all files in the directory;
    //https://tpoint.hashnode.dev/flutter-list-all-files-in-directory
    files = Directory(_appDocumentsDirectory).listSync();
    if (files.length > 30) {
      final int idx = files.length - 30;
      for (var i = 0; i < idx; i++) {
        files[i].delete();
      }
    }

    // final toDelete = File('$_appDocumentsDirectory/stalefile.txt');
    // try {
    //   await toDelete.delete();
    // } catch (e) {
    //   print(e);
    // }
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

extension Format on DateTime {
  String intoStr() {
    return '0$year-${month.intoTwoDigit()}-${day.intoTwoDigit()} ${hour.intoTwoDigit()}:${minute.intoTwoDigit()}:${second.intoTwoDigit()}';
  }
}

// format : YYYY-MM-DD HH:MM:SS 