import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';
import 'package:lifting_progress_tracker/pages/training_plan.dart';
import 'package:lifting_progress_tracker/providers/environment_provider.dart';
import 'package:lifting_progress_tracker/providers/table_provider.dart';
import 'package:lifting_progress_tracker/widgets/table/add_entry_button.dart';
import 'package:lifting_progress_tracker/widgets/table/workout_table.dart';
import 'package:provider/provider.dart';

/// Wraps test widgets into material app.
Widget createWidgetForTesting({required Widget child}) {
  return MaterialApp(
    home: child,
  );
}

/// Init the table provider with its workout table.
Future<void> initTableProvider(WidgetTester tester) async {
  await tester.pumpWidget(
    createWidgetForTesting(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TableProvider(
              trainingPlanId: "trainingPlanId",
              fetchEntries: false,
            ),
          )
        ],
        child: WorkoutTable(),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> initEnvironmentProvider(WidgetTester tester) async {
  await tester.pumpWidget(
    Provider(
      create: (context) => EnvironmentProvider(environment: "TEST"),
      child: createWidgetForTesting(child: TrainingPlanPage()),
    ),
  );
  await tester.pumpAndSettle();
}

/// Test data for table provider.
final List<PlanEntry> testData = [PlanEntry(), PlanEntry()];

void main() {
  testWidgets(
      '1. When training plan page is build a workout table widget is shown',
      (WidgetTester tester) async {
    await initEnvironmentProvider(tester);
    expect(find.byType(WorkoutTable), findsOneWidget);
  });

  testWidgets("2. When table provider entries are changed the count is updated",
      (WidgetTester tester) async {
    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));
    // required to call listen:false outside of widget tree.
    Provider.of<TableProvider>(context, listen: false).tableEntries = testData;
    expect(Provider.of<TableProvider>(context, listen: false).count == 2, true);
  });

  testWidgets(
      "3. When the table is initialized without fetching entries it should be empty",
      (WidgetTester tester) async {
    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));
    expect(Provider.of<TableProvider>(context, listen: false).count == 0, true);
  });

  testWidgets("4. when the add enty button is tapped a new entry is added",
      (WidgetTester tester) async {
    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));
    await tester.tap(find.byType(AddEntryButton));
    await tester.pumpAndSettle();
    expect(Provider.of<TableProvider>(context, listen: false).count == 1, true);
  });

  testWidgets("5. when the remove enty button is tapped one entry is removed",
      (WidgetTester tester) async {
    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));
    Provider.of<TableProvider>(context, listen: false).addEntry(testData[0]);
    Provider.of<TableProvider>(context, listen: false).addEntry(testData[1]);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(EntryRemovalButton).first);
    await tester.pumpAndSettle();
    expect(Provider.of<TableProvider>(context, listen: false).count == 1, true);
    expect(find.byType(EntryRemovalButton), findsNWidgets(1));
  });
  testWidgets("6. the count and number of entry removal buttons are the same",
      (WidgetTester tester) async {
    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));
    Provider.of<TableProvider>(context, listen: false).addEntry(testData[0]);
    Provider.of<TableProvider>(context, listen: false).addEntry(testData[1]);
    Provider.of<TableProvider>(context, listen: false).addEntry(testData[1]);
    await tester.pumpAndSettle();

    final int count = Provider.of<TableProvider>(context, listen: false).count;
    expect(find.byType(EntryRemovalButton), findsNWidgets(count));
  });

  testWidgets(
      "7. the count and number of entry removal buttons are the same even after adding entries using the button",
      (WidgetTester tester) async {
    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));
    await tester.tap(find.byType(AddEntryButton));
    await tester.pumpAndSettle();

    final int count = Provider.of<TableProvider>(context, listen: false).count;
    expect(find.byType(EntryRemovalButton), findsNWidgets(count));
  });

  testWidgets(
      "8. the count and number of entry removal buttons are the same even after removing entries using the buttons",
      (WidgetTester tester) async {
    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));
    Provider.of<TableProvider>(context, listen: false).addEntry(testData[0]);
    Provider.of<TableProvider>(context, listen: false).addEntry(testData[1]);
    Provider.of<TableProvider>(context, listen: false).addEntry(testData[1]);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(EntryRemovalButton).first);
    await tester.pumpAndSettle();
    final int count = Provider.of<TableProvider>(context, listen: false).count;
    expect(find.byType(EntryRemovalButton), findsNWidgets(count));
  });
}
