import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';

import 'package:lifting_progress_tracker/main.dart' as app;
import 'package:lifting_progress_tracker/pages/home.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('smoke tests', () {
    testWidgets('start application', (tester) async {
      app.main();
      await tester.pumpAndSettle();
    });
  });
}
