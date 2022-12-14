import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit({required this.connectivity}) : super(InternetInitial()) {
    connectionStream = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        emitConnection(InternetConnection.none);
      } else if (event == ConnectivityResult.mobile) {
        emitConnection(InternetConnection.mobile);
      } else if (event == ConnectivityResult.wifi) {
        emitConnection(InternetConnection.wifi);
      } else {
        emitConnection(InternetConnection.annonymous);
      }
    });
  }
  final Connectivity connectivity;
  late StreamSubscription connectionStream;

  void emitConnection(InternetConnection status) =>
      emit(InternetStatus(status: status));

  @override
  Future<void> close() {
    connectionStream.cancel();
    return super.close();
  }
}
