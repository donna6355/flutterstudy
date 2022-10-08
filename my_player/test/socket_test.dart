import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'dart:io';

// import 'socket_test.mocks.dart';

// @GenerateMocks([Socket])
class MockSocket extends Mock implements Socket {
  Future<Socket> connect() async {
    return await Socket.connect('', 1234);
  }
}

void main() {
  test('socket msg send and listen test', () {
    final socket = MockSocket();
    // when(socket.connect()).thenReturn(Future<Socket>);
  });
}
