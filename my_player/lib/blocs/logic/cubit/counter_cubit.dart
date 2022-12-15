import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/blocs/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStream;
  CounterCubit({required this.internetCubit}) : super(CounterState(0)) {
    internetStream = monitorInternet();
  }

  StreamSubscription<InternetState> monitorInternet() {
    return internetCubit.stream.listen((InternetState event) {
      if (event is InternetStatus && event.status == InternetConnection.none) {
        decrement();
      } else if (event is InternetStatus) {
        increment();
      }
    });
  }

  void increment() => emit(CounterState(state.counterValue + 1));
  void decrement() => emit(CounterState(state.counterValue - 1));

  @override
  Future<void> close() {
    internetStream.cancel();
    return super.close();
  }
}
