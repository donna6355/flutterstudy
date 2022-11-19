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
  // WidgetsFlutterBinding.ensureInitialized();
  // await Preferences.init();
  group('handle response unit test', () {
    test('OK return asdk string', () {
      // await Preferences.init();
      expect(TCP().handleRes('OK'), 'asdf');
      // print(TCP()
      //     .globalTest); // this is inital value... doesnt match the new one..
    });
    test('no ok return _seq number', () {
      expect(TCP().handleRes('test'), '0001');
      // when(socket.connect()).thenReturn(Future<Socket>);
    });

    //using testWidget get buildContext
    testWidgets('me testing', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext ctx) {
            var actual = TCP().handleNmjs(' NESSOK0000 ', ctx);
            expect(actual, ' NESSOK0000 ');

            // The builder function must return a widget.
            return const SizedBox.shrink();
          },
        ),
      );
    });
//it doesnt work...
    // test('is this okay?', () {
    //   BuildContext? ctx;
    //   Builder(
    //     builder: (BuildContext context) {
    //       ctx = context;
    //       return const SizedBox.shrink();
    //     },
    //   );
    //   var actual = TCP().handleNmjs(' NMJSOK0000 ', ctx!);
    //   expect(actual, ' NMJSOK0000 ');
    // });
  });
}
