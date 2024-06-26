import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/starting/starting.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_day.dart';
import 'package:lifting_progress_tracker/pages/training_period.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

import '../test_utils/helpers/data.dart';
import 'modules/navigate.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    connectToMockDatabase();
    setCurrentUser();
  });

  group('navigation smoke tests:', () {
    testWidgets('start application without any errors', (tester) async {
      await startApp(tester);
      expect(find.byType(StartingPage), findsOneWidget);
    });

    testWidgets(
        '1. navigate from home to statistics page without occurring any errors',
        (tester) async {
      await startApp(tester);
      await navigateToStatistics(tester);
      expect(find.byType(StatisticsPage), findsOneWidget);
    });

    testWidgets(
        '2. navigate from home to the calendar page without occurring any errors',
        (tester) async {
      await startApp(tester);
      await navigateToCalendar(tester);
      expect(find.byType(CalendarPage), findsOneWidget);
    });

    testWidgets(
        '3. navigate from home to the training day page without occurring any errors',
        (tester) async {
      await startApp(tester);
      await navigateToCalendar(tester);
      await tester
          .tap(find.widgetWithText(ElevatedButton, trainingDayRouteLabel));

      await tester.pumpAndSettle();
      expect(find.byType(TrainingDayPage), findsOneWidget);
    });

    testWidgets(
        '4. navigate from home to the training period page without occurring any errors',
        (tester) async {
      await startApp(tester);
      await navigateToCalendar(tester);
      await tester
          .tap(find.widgetWithText(ElevatedButton, trainingPeriodRouteLabel));
      await tester.pumpAndSettle();
      expect(find.byType(TrainingPeriodPage), findsOneWidget);
    });

    testWidgets(
        '5. navigate from home to the training plan list page without occurring any errors',
        (tester) async {
      await startApp(tester);
      await navigateToTrainingPlanList(tester);
      expect(find.byType(TrainingPlanListPage), findsOneWidget);
    });

    testWidgets(
        '6. navigate from home to the training plan page without occurring any errors',
        (tester) async {
      await navigateToTrainingPlan(tester);
    });
  });
}
