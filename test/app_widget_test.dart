import 'package:flutter_test/flutter_test.dart';
import 'package:lifting_progress_tracker/app.dart';

import '../test_utils/helpers/data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  connectToMockDatabase();
  setCurrentUser();

  testWidgets('App smoke test, start the app and see what happens.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MyApp(),
    );
  });
}
