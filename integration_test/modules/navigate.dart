import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lifting_progress_tracker/app.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/pages/exercise.dart';
import 'package:lifting_progress_tracker/pages/training_plan.dart';

Future<void> startApp(WidgetTester tester) async {
  runApp(const MyApp());
  await tester.pumpAndSettle();
}

Future<void> navigateToHome(WidgetTester tester) async {
  await tester.tap(find.text(homeRouteLabel));
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
  await tester.tap(find.text(trainingPlanListRouteLabel));
  await tester.pumpAndSettle();
}

Future<void> navigateToTrainingPlan(WidgetTester tester) async {
  await startApp(tester);
  await navigateToTrainingPlanList(tester);
  await tester.tap(find.widgetWithText(ElevatedButton, trainingPlanRouteLabel));
  await tester.pumpAndSettle();
  expect(find.byType(TrainingPlanPage), findsOneWidget);
}

Future<void> navigateToExercise(WidgetTester tester) async {
  await navigateToTrainingPlan(tester);
  await tester.tap(find.widgetWithText(ElevatedButton, exerciseRouteLabel));
  await tester.pumpAndSettle();
  expect(find.byType(ExercisePage), findsOneWidget);
}
