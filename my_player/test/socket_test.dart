import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_player/shared_preferences.dart';
import 'dart:io';

import 'package:my_player/socket.dart';

// import 'socket_test.mocks.dart';

// @GenerateMocks([Socket])
// class MockSocket extends Mock implements Socket {
//   Future<Socket> connect() async {
//     return await Socket.connect('', 1234);
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  group('handle response unit test', () {
    test('OK get the global test string', () {
      // await Preferences.init();
      expect(TCP().handleRes('OK'), '0');
      // print(TCP()
      //     .globalTest); // this is inital value... doesnt match the new one..
    });
    test('no ok return empty string', () {
      expect(TCP().handleRes('test'), '');
      // when(socket.connect()).thenReturn(Future<Socket>);
    });
  });
}
