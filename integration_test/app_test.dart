import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:lifting_progress_tracker/main.dart' as app;
import 'package:lifting_progress_tracker/pages/home.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('navigation smoke tests', () {
    testWidgets('start application without errors', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('navigate from home to statistics without errors',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ElevatedButton, "Statistik"));
      await tester.pumpAndSettle();
      expect(find.byType(StatisticsPage), findsOneWidget);
    });
  });
}
