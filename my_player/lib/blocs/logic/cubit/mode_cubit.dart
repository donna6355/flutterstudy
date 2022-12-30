import 'package:flutter_bloc/flutter_bloc.dart';

part 'mode_state.dart';

class ModeCubit extends Cubit<ModeState> {
  ModeCubit() : super(InitialMode());

  void resetMode() => emit(InitialMode());
  void disableMode() => emit(UnavailableMode());
  void enterAdminMode() => emit(AdminMode('ADMIN MAIN'));
}
