import 'package:mockito/mockito.dart';

import '../lib/counter.dart';
import '../lib/test_widget.dart';
import 'package:flutter_test/flutter_test.dart';

class MockClient extends Mock implements Counter {
  int val = 0;

  void increment() => val++;
}

void main() {
// UNIT TEST
// 1. Add the flutter_test dependency
// 2. Create a test file (=====/lib/counter.dart=====/test/counter_test.dart=====)
// 3. Create a class to test (lib/counter.dart)
// 4. Write a test for our class(test/counter_test.dart)
// 5. Combine multiple tests in a group

  test('increment counter test', () {
    final counter = Counter(); // test class, method,... unit!
    counter.increment();
    expect(counter.val, 1);
  });

//Mockito tutorial
  test('increment counter test', () {
    final counter = MockClient(); // test class, method,... unit!
    when(counter.increment());
    expect(counter.val, 1);
  });

  group('inc and dec test', () {
    final counter = Counter();
    test('check default', () {
      expect(counter.val, 0);
    });
    test('increment counter test', () {
      counter.increment();
      expect(counter.val, 1);
    });
    test('decrement counter test', () {
      counter.decrement();
      expect(counter.val, 0);
    });
  });

// ===================================================================
//WIDGET TEST
// 1. Add the flutter_test dependency
// 2. Create a widget to test(=====/lib/test_widget.dart=====)
// 3. Create a testWidgets test
// 4. Build the widget using the WidgetTester
// 5. Search for our widget using a Finder
// 6. Verify the widget using a Matcher

// 3. Create a testWidgets test
  testWidgets('this is test for widget test', (WidgetTester tester) async {
// 4. Build the widget using the WidgetTester
    await tester
        .pumpWidget(const TestWidget(title: 'title', message: 'message'));

// 5. Search for our widget using a Finder
    final titleFinder = find.text('title');
    final msgFinder = find.text('message');

    //6. Verify the widget using a Matcher
    expect(titleFinder, findsOneWidget);
    expect(msgFinder, findsOneWidget);

// [findsNothing], when you want the finder to not find anything.
// [findsWidgets], when you want the finder to find one or more widgets.
// [findsNWidgets], when you want the finder to find a specific number of widgets.
  });
}
