import 'dart:ffi';
//open library => look up function => call function
//as type systems are different, explicitly specify both Foreign type (C# in this case) and Dart type!!!!!
//[Void] is not constructible in the Dart code and serves purely as marker in type signatures.
//**BOOL returns int.... but not sure how to handle this... BOOL is undefined TT
//https://temphi20.tistory.com/14
//Failed to load dynamic library (error code 193): 64bit 환경인데 32bit로 dll을 컴파일해서 생긴 오류였다. 몇 비트인지 확인 제대로 할 것.

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
