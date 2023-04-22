import 'dart:io';

import './dir_helper.dart';

enum LogLevel {
  inf,
  tcp,
  pcb,
  bcd,
  mon,
  cam,
  ntw;

  @override
  String toString() => name.toUpperCase();
}

enum LogTag {
  scr,
  snd,
  rcv,
  err,
  rmk;

  @override
  String toString() => '[${name.toUpperCase()}]';
}

class LogController {
  LogController._();
  static late File _todayFile;
  static String _log = '';

  static Future<void> init() async {
    _todayFile = File(DirHelper.appLogFile);
    if (await _todayFile.exists() == false) _todayFile.writeAsString('');

    writeLog(
        level: LogLevel.inf,
        tag: LogTag.rmk,
        msg:
            '===============================UNO_TEST_START===============================');
  }

  static Future<void> writeLog({
    required LogLevel level,
    required LogTag tag,
    required String msg,
    bool writeFile = false,
  }) async {
    _log =
        '$_log${DateTime.now().forLogData()} ${level.toString()} ${tag.toString()} $msg\r\n';
    if (!writeFile) return;
    String prevData = await _todayFile.readAsString();
    await _todayFile.writeAsString('$prevData$_log');
    _log = '';
  }
}

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

  int forSes() {
    return (millisecondsSinceEpoch / 1000).round();
  }
}
