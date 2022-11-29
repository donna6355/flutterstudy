import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_player/shared_preferences.dart';
import 'dart:io';
import 'package:mockito/mockito.dart';

import 'package:my_player/socket.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'socket_test.mocks.dart';

// @GenerateMocks([Socket])
// class MockSocket extends Mock implements Socket {
//   Future<Socket> connect() async {
//     return await Socket.connect('', 1234);
//   }
// }

class MockPreferences extends Mock implements SharedPreferences {}

class MockBuildContext extends Mock implements BuildContext {}

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Preferences.init();
  group('handle response unit test', () {
    test('OK return asdk string', () {
      final preferences = MockPreferences();
      // await Preferences.init();
      expect(TCP().handleRes('OK'), 'asdf');
      when(preferences.get('dkfj')).thenReturn('expected');
      // print(TCP()
      //     .globalTest); // this is inital value... doesnt match the new one..
    });
    test('no ok return _seq number', () {
      expect(TCP().handleRes('test'), '0001');
      // when(socket.connect()).thenReturn(Future<Socket>);
    });

    //using testWidget get buildContext
    testWidgets('me testing', (WidgetTester tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            ctx = context;
            // The builder function must return a widget.
            return const SizedBox.shrink();
          },
        ),
      );
      var actual = TCP().handleNmjs(' NESSOK0000 ', ctx);
      expect(actual, ' NESSOK0000 ');
      //this way you can set break point outside of pumpWidget!
    });

    test('try mockbuildcontext', () {
      final BuildContext ctx = MockBuildContext();

      var actual = TCP().handleNmjs(' NESSOK0000 ', ctx);
      expect(actual, ' NESSOK0000 ');
    });
//it doesnt work... ctx is always null.. and it doesnt drain error
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
