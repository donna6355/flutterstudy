part of 'timer_cubit.dart';

abstract class TimerState {
  TimerState(this.duration);
  int duration;
}

class TimerInitial extends TimerState {
  TimerInitial() : super(60);
}

class TimerResume extends TimerState {
  TimerResume() : super(60);
}

class TimerPause extends TimerState {
  TimerPause() : super(0);
}
