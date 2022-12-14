part of 'internet_cubit.dart';

enum InternetConnection {
  none,
  mobile,
  wifi,
  annonymous,
}

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetStatus extends InternetState {
  final InternetConnection status;
  InternetStatus({required this.status});
}
