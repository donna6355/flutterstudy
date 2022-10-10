import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();
  static late SharedPreferences _prefsInstance;

  static Future<void> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    updateCount('bootCount');
  }

  static String get machineId =>
      _prefsInstance.getString('machineId') ??
      '\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$';
  static void saveMachineId(String id) {
    _prefsInstance.setString('machineId', id);
  }

  static int get bootCount => _prefsInstance.getInt('bootCount') ?? 0;
  static int get tcpSequence => _prefsInstance.getInt('tcpSequence') ?? 0;

  static int updateCount(String key) {
    final int currentCount = _prefsInstance.getInt(key) ?? 0;
    int newCount = 0;
    if (currentCount != 9999) {
      newCount = currentCount + 1;
    }
    _prefsInstance.setInt(key, newCount);
    return newCount;
  }
}
