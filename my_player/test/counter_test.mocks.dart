// Mocks generated by Mockito 5.3.2 from annotations
// in my_player/test/counter_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:my_player/counter.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [Counter].
///
/// See the documentation for Mockito's code generation for more information.
class MockCounter extends _i1.Mock implements _i2.Counter {
  @override
  int get val => (super.noSuchMethod(
        Invocation.getter(#val),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set val(int? _val) => super.noSuchMethod(
        Invocation.setter(
          #val,
          _val,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.Test get test => (super.noSuchMethod(
        Invocation.getter(#test),
        returnValue: _i2.Test.stopped,
        returnValueForMissingStub: _i2.Test.stopped,
      ) as _i2.Test);
  @override
  set test(_i2.Test? _test) => super.noSuchMethod(
        Invocation.setter(
          #test,
          _test,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String str() => (super.noSuchMethod(
        Invocation.method(
          #str,
          [],
        ),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  int increment() => (super.noSuchMethod(
        Invocation.method(
          #increment,
          [],
        ),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  int decrement() => (super.noSuchMethod(
        Invocation.method(
          #decrement,
          [],
        ),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
}
