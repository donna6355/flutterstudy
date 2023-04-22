import './dll_money_dispenser.dart';

class BillRepo {
  BillRepo._();
  static final int portNum = 1;

  static bool init() {
// call functions as the order of following : setLog , openPort, connectionCheck, init, dispense, closePort
    List<Function> process = [
      () => _logWrapper(
            fn: () => DllMoney.noteOpenPort(portNum),
            method: 'openPort($portNum)',
            log: 'open bill port',
          ),
      () => _logWrapper(
            fn: DllMoney.noteConnectionCheck,
            method: 'connectionCheck()',
            log: 'check bill connection',
          ),
      () => _logWrapper(
            fn: DllMoney.noteInit,
            method: 'init()',
            log: 'init bill',
          ),
    ];
    bool goodToGo = true;
    for (var i = 0; i < process.length; i++) {
      if (!goodToGo) return false;
      goodToGo = process[i]();
    }
    return goodToGo;
  }

  static Future<int> dispenseNRes(int qty, {bool update = true}) async {
    int billRes = 0;
    bool goodToGo = _logWrapper(
      fn: () => DllMoney.noteDispense(qty),
      method: 'Dispense($qty) ',
      log: 'dispense bill',
    );

    await Future.delayed(Duration(seconds: qty ~/ 3 + 1));
    billRes = DllMoney.noteDispenseRes();
    while (billRes == 111) {
      await Future.delayed(const Duration(seconds: 1));
      billRes = DllMoney.noteDispenseRes();
    }

    bool res = goodToGo && billRes == qty;

    return billRes;
  }

  static bool reset() {
    return _logWrapper(
      fn: DllMoney.noteInit,
      method: 'init()',
      log: 'reset bill',
    );
  }

  static bool closePort() {
    return _logWrapper(
      fn: () => DllMoney.noteClosePort(portNum),
      method: 'closePort($portNum)',
      log: 'close bill port',
    );
  }

  static bool _logWrapper({
    required Function fn,
    required String method,
    required String log,
    int success = 1,
  }) {
    int res = 0;
    try {
      res = fn();
    } catch (e) {}
    return res == success;
  }
}
