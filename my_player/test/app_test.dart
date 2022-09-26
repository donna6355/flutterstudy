import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:my_player/main.dart' as app;

//integration test
// 1. Create an app to test
// 2. Add the integration_test dependency
// 3. Create the test files (=====app_test.dart=====)
// 4. Write the integration test
// 5. Run the integration test (flutter test test/app_test.dart =========== or ============ flutter test test)

void main() {
  // 4-1. Initialize IntegrationTestWidgetsFlutterBinding, a singleton service that executes tests on a physical device.
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('this is test for integration test', () {
    // 4-2. Interact and tests widgets using the WidgetTester class.
    testWidgets('tap on the next button', (tester) async {
      app.main();
      tester.pumpAndSettle();
      // 4-3. Test the important scenarios.
      expect(find.byIcon(Icons.play_arrow), findsOneWidget);

      // // Finds the floating action button to tap on.
      // final Finder fab = find.byTooltip('Increment');

      // // Emulate a tap on the floating action button.
      // await tester.tap(fab);

      // // Trigger a frame.
      // await tester.pumpAndSettle();

      // // Verify the counter increments by 1.
      // expect(find.text('1'), findsOneWidget);
    });
  });
}
