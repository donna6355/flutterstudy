import 'dart:async';

import 'package:bloc_try/cubit/timer_cubit.dart';

class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}

class CubitTicker {
   CubitTicker(this.timerCubit);
  static late Timer timer;
  static TimerCubit timerCubit;

  static Future<void> tick() async {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      timerCubit.emit(state)
    });
  }
}
