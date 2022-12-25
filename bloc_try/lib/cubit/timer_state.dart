part of 'timer_cubit.dart';

@immutable
abstract class TimerState {}

class TimerInitial extends TimerState {}

class TimerResume extends TimerState {}

class TimerPause extends TimerState {}
