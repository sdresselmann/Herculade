// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:lifting_progress_tracker/app.dart';

import '../test_utils/helpers/data.dart';

void main() {
  connectToMockDatabase();
  setCurrentUser();

  testWidgets('App smoke test, start the app and see what happens.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MyApp(),
    );
  });
}
