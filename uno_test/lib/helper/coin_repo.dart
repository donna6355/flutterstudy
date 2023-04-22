import './dll_money_dispenser.dart';

class CoinRepo {
  CoinRepo._();
  static final int portNum = 2;

  static bool init() {
// call functions as the order of following : setLog , openPort, connectionCheck, init, dispense, closePort
    List<Function> process = [
      () => _logWrapper(
            fn: () => DllMoney.coinOpenPort(portNum),
            method: 'openPort($portNum)',
            log: 'open coin port',
          ),
      () => _logWrapper(
            fn: DllMoney.coinConnectionCheck,
            method: 'connectionCheck()',
            log: 'check coin connection',
          ),
      () => _logWrapper(
            fn: DllMoney.coinInit,
            method: 'init()',
            log: 'init coin',
          ),
    ];
    bool goodToGo = true;
    for (var i = 0; i < process.length; i++) {
      if (!goodToGo) return false;
      goodToGo = process[i]();
    }
    return goodToGo;
  }

  static Future<int> dispenseNRes({bool update = true}) async {
    int coinRes = 0;
    bool goodToGo = _logWrapper(
      fn: () => DllMoney.coinDispense(1),
      method: 'Dispense(1) ',
      log: 'dispense coin',
    );
    await Future.delayed(const Duration(milliseconds: 400));
    coinRes = DllMoney.coinDispenseRes();
    while (coinRes == 111) {
      await Future.delayed(const Duration(seconds: 1));
      coinRes = DllMoney.coinDispenseRes();
    }

    bool res = goodToGo && coinRes == 1;

    return coinRes;
  }

  static bool reset() {
    return _logWrapper(
      fn: DllMoney.noteInit,
      method: 'init()',
      log: 'reset coin',
    );
  }

  static bool closePort() {
    return _logWrapper(
      fn: () => DllMoney.noteClosePort(portNum),
      method: 'closePort($portNum)',
      log: 'close coin port',
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
