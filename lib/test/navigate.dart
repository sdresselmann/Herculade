// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/main.dart' as app;

Future<void> startApp(WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle();
}

Future<void> navigateToStatistics(WidgetTester tester) async {
  await tester.tap(find.text(statisticsRouteLabel));
  await tester.pumpAndSettle();
}

Future<void> navigateToCalendar(WidgetTester tester) async {
  await tester.tap(find.text(calendarRouteLabel));
  await tester.pumpAndSettle();
}

Future<void> navigateToTrainingPlanList(WidgetTester tester) async {
  await tester.tap(find.text(trainingplanListRouteLabel));
  await tester.pumpAndSettle();
}
