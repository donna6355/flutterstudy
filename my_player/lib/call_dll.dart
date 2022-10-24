import 'dart:ffi';
//open library => look up function => call function
//as type systems are different, explicitly specify both Foreign type (C# in this case) and Dart type!!!!!

class SerialMainBoard {
  SerialMainBoard._();
  static final DynamicLibrary lalaDll =
      DynamicLibrary.open('utilslib/Lalaloopdish_Test.dll');

  static final bool Function(int) openPort = lalaDll
      .lookupFunction<Bool Function(Int32), bool Function(int)>('openPort');
  static final bool Function() closePort =
      lalaDll.lookupFunction<Bool Function(), bool Function()>('closePort');
  static final bool Function() unlock = lalaDll
      .lookupFunction<Bool Function(), bool Function()>('Machine1_unlock_Op');
  static final bool Function() greenBlink = lalaDll
      .lookupFunction<Bool Function(), bool Function()>(' GREEN_blink_Op');
}
