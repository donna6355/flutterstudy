import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'dart:io';

import 'package:my_player/socket.dart';

// import 'socket_test.mocks.dart';

// @GenerateMocks([Socket])
class MockSocket extends Mock implements Socket {
  Future<Socket> connect() async {
    return await Socket.connect('', 1234);
  }
}

void main() {
  group('handle response unit test', () {
    test('OK get the global test string', () {
      expect(TCP().handleRes('OK'), 'this is asdf');
      print(TCP().globalTest);
    });
    test('no ok return empty string', () {
      expect(TCP().handleRes('test'), '');
      // when(socket.connect()).thenReturn(Future<Socket>);
    });
  });
}
