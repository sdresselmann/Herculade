import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lifting_progress_tracker/components/workout_table.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';
import 'package:lifting_progress_tracker/pages/training_plan.dart';
import 'package:lifting_progress_tracker/providers/table_provider.dart';
import 'package:provider/provider.dart';

/// Wraps test widgets into material app.
Widget createWidgetForTesting({required Widget child}) {
  return MaterialApp(
    home: child,
  );
}

/// Test data for table provider.
final List<PlanEntry> testData2 = [PlanEntry(), PlanEntry()];

void main() {
  testWidgets(
      '1. When training plan page is build a workout table widget is shown',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: TrainingPlanPage()));
    await tester.pumpAndSettle();
    expect(find.byType(WorkoutTable), findsOneWidget);
  });

  testWidgets("2. When table provider entries are changed the count is updated",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetForTesting(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) =>
                  TableProvider(trainingPlanId: "trainingPlanId"),
            )
          ],
          child: WorkoutTable(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final context = tester.element(find.byType(WorkoutTable));
    // required to call listen:false outside of widget tree.
    Provider.of<TableProvider>(context, listen: false).tableEntries = testData2;
    expect(Provider.of<TableProvider>(context, listen: false).count == 2, true);
  });
}