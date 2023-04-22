import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import './log_data.dart';

class DirHelper {
  static String _machineId = 'UNO_PCB_TEST';
  static String _appDocsDir = '';
  static String _appLogDir = '';
  static String _appLogtodayDir = '';

  static String _appLogFile = '';
  DirHelper._();

  static Future<void> init() async {
    final String originPath = (await getApplicationDocumentsDirectory()).path;
    _appDocsDir = p.join(originPath, 'uno_test');
    _appLogDir = p.join(_appDocsDir, 'logs');
    _appLogtodayDir = p.join(_appLogDir, DateTime.now().forTitle());
    _appLogFile = p.join(
        _appLogtodayDir, '${_machineId}_${DateTime.now().forTitle()}.log');

    await Future.forEach([
      _appLogtodayDir,
    ], (path) async => await _checkAndCreateDir(path));
  }

  static Future<void> _checkAndCreateDir(String path) async {
    if (await Directory(path).exists() == false) {
      await Directory(path).create(recursive: true);
      LogController.writeLog(
          level: LogLevel.inf, tag: LogTag.rmk, msg: 'create dir : $path');
    }
  }

  static String get machineId => _machineId;
  static String get appLogDir => _appLogDir;
  static String get appLogFile => _appLogFile;
}
