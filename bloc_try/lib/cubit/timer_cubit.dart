import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  void timerStart() => emit(TimerInitial());
  void timerPause() => emit(TimerPause());
  void timerResume() => emit(TimerResume());
}
