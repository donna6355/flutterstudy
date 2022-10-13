import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileController {
  FileController._();
  static late Directory _appDocumentsDirectory;
  Future<void> init() async {
    _appDocumentsDirectory = await getApplicationDocumentsDirectory();
  }

  Future<void> writeFile() async {
    final file = File(
        '${_appDocumentsDirectory.path}/${DateTime.now().toString().substring(0, 10)}.txt');
    if (await file.exists()) {
      String prevData = await file.readAsString();
      String newData = 'this is new data\n';
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
