import 'package:flutter_test/flutter_test.dart';
import 'package:my_player/test_widget.dart';

void main() {
  testWidgets('test widget ...', (tester) async {
    await tester
        .pumpWidget(const TestWidget(title: 'title', message: 'message'));
    expect(find.text('title'), findsOneWidget);
    expect(find.text('message'), findsOneWidget);
  });
}
