import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';

import 'package:lifting_progress_tracker/main.dart' as app;
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/exercise.dart';
import 'package:lifting_progress_tracker/pages/home.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_day.dart';
import 'package:lifting_progress_tracker/pages/training_period.dart';
import 'package:lifting_progress_tracker/pages/training_plan.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('navigation smoke tests', () {
    testWidgets('start application without any errors', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets(
        'navigate from home to statistics page without occurring any errors',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ElevatedButton, statisticsRoute));
      await tester.pumpAndSettle();
      expect(find.byType(StatisticsPage), findsOneWidget);
    });

    testWidgets(
        'navigate from home to the calendar page without occurring any errors',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ElevatedButton, calendarRoute));
      await tester.pumpAndSettle();
      expect(find.byType(CalendarPage), findsOneWidget);
    });

    testWidgets(
        'navigate from home to the training day page without occurring any errors',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ElevatedButton, calendarRoute));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ElevatedButton, trainingDayRoute));
      await tester.pumpAndSettle();
      expect(find.byType(TrainingDayPage), findsOneWidget);
    });

    testWidgets(
        'navigate from home to the training period page without occurring any errors',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ElevatedButton, calendarRoute));
      await tester.pumpAndSettle();
      await tester
          .tap(find.widgetWithText(ElevatedButton, trainingPeriodRoute));
      await tester.pumpAndSettle();
      expect(find.byType(TrainingPeriodPage), findsOneWidget);
    });

    testWidgets(
        'navigate from home to the training plan list page without occurring any errors',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester
          .tap(find.widgetWithText(ElevatedButton, trainingplanListRoute));
      await tester.pumpAndSettle();
      expect(find.byType(TrainingPlanListPage), findsOneWidget);
    });

    testWidgets(
        'navigate from home to the training plan page without occurring any errors',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester
          .tap(find.widgetWithText(ElevatedButton, trainingplanListRoute));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ElevatedButton, trainingPlanRoute));
      await tester.pumpAndSettle();
      expect(find.byType(TrainingPlanPage), findsOneWidget);
    });

    testWidgets(
        'navigate from home to the exercise page without occurring any errors',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester
          .tap(find.widgetWithText(ElevatedButton, trainingplanListRoute));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ElevatedButton, trainingPlanRoute));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ElevatedButton, exerciseRoute));
      await tester.pumpAndSettle();
      expect(find.byType(ExercisePage), findsOneWidget);
    });
  });
}