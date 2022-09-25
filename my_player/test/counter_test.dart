import '../lib/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('increment counter test', () {
    final counter = Counter(); // test class, method,... unit!
    counter.increment();
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
}


// UNIT TEST
// 1. Add the test dependency
// 2. Create a test file (=====/lib/counter.dart=====/test/counter_test.dart=====)
// 3. Create a class to test (lib/counter.dart)
// 4. Write a test for our class(test/counter_test.dart)
// 5. Combine multiple tests in a group