import 'dart:ffi';
import 'dart:io';

import 'package:path/path.dart';

typedef DartIntFn = int Function(int);
typedef FfiIntFn = Int32 Function(Int32);
typedef DartPointerFn = int Function(Pointer<Uint8>, bool);
typedef FfiPointerfn = Int32 Function(Pointer<Uint8>, Bool);
typedef DartReturnFn = int Function();
typedef FfiReturnFn = Int32 Function();

class DllMoney {
  // call functions as the order of following : setLog , openPort, connectionCheck, init, dispense, closePort

  DllMoney._();
  static final _libPath = normalize(join(Directory.current.path, 'data',
      'flutter_assets', 'assets', 'dlls', 'B_DSP.dll'));

  static final DynamicLibrary lalaDll = DynamicLibrary.open(_libPath);
  static final DartPointerFn setLog =
      lalaDll.lookupFunction<FfiPointerfn, DartPointerFn>('SetLog');
  static final DartIntFn noteOpenPort =
      lalaDll.lookupFunction<FfiIntFn, DartIntFn>('note_openPort');
  static final DartIntFn noteClosePort =
      lalaDll.lookupFunction<FfiIntFn, DartIntFn>('note_closePort');
  static final DartReturnFn noteConnectionCheck = lalaDll
      .lookupFunction<FfiReturnFn, DartReturnFn>('note_Connection_Check');
  static final DartReturnFn noteInit =
      lalaDll.lookupFunction<FfiReturnFn, DartReturnFn>('note_Init');
  static final DartIntFn noteDispense =
      lalaDll.lookupFunction<FfiIntFn, DartIntFn>('note_Dispense');
  static final DartReturnFn noteDispenseRes =
      lalaDll.lookupFunction<FfiReturnFn, DartReturnFn>('note_D_response');
  static final DartReturnFn noteClearTotal = lalaDll
      .lookupFunction<FfiReturnFn, DartReturnFn>('note_GrandTotal_Clear');

  static final DartIntFn coinOpenPort =
      lalaDll.lookupFunction<FfiIntFn, DartIntFn>('coin_openPort');
  static final DartIntFn coinClosePort =
      lalaDll.lookupFunction<FfiIntFn, DartIntFn>('coin_closePort');
  static final DartReturnFn coinConnectionCheck = lalaDll
      .lookupFunction<FfiReturnFn, DartReturnFn>('coin_Connection_Check');
  static final DartReturnFn coinInit =
      lalaDll.lookupFunction<FfiReturnFn, DartReturnFn>('coin_Init');
  static final DartIntFn coinDispense =
      lalaDll.lookupFunction<FfiIntFn, DartIntFn>('coin_Dispense');
  static final DartReturnFn coinDispenseRes =
      lalaDll.lookupFunction<FfiReturnFn, DartReturnFn>('coin_D_response');
  static final DartReturnFn coinClearTotal = lalaDll
      .lookupFunction<FfiReturnFn, DartReturnFn>('coin_GrandTotal_Clear');
}
