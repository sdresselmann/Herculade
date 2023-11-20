import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';
import 'package:lifting_progress_tracker/providers/table_provider.dart';
import 'package:lifting_progress_tracker/services/firebase/firestore_service.dart';
import 'package:lifting_progress_tracker/services/firebase/mocks/firestore_mock_data.dart';
import 'package:lifting_progress_tracker/services/firebase/mocks/mock_firestore_service.dart';
import 'package:lifting_progress_tracker/types/types.dart';
import 'package:lifting_progress_tracker/widgets/table/add_entry_button.dart';
import 'package:lifting_progress_tracker/widgets/table/entry_removal_button.dart';
import 'package:lifting_progress_tracker/widgets/table/workout_table.dart';
import 'package:provider/provider.dart';

const String trainingPlanId = 'trainingplan1';
final MockFirestoreService mockFirestoreService = MockFirestoreService();
RawFirestoreData mockupData = {};

Widget createWidgetForTesting({required Widget child}) {
  return MaterialApp(
    home: child,
  );
}

Future<void> initTableProvider(WidgetTester tester) async {
  await tester.pumpWidget(
    createWidgetForTesting(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TableProvider(
              trainingPlanId: trainingPlanId,
            ),
          ),
        ],
        child: WorkoutTable(),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> setupMocks() async {
  GetIt.I.registerSingleton<FirestoreService>(mockFirestoreService);

  final FirestoreMockData firestoreMockData =
      mockFirestoreService.firestoreMockData;

  firestoreMockData.setDefaultMockData();
  mockupData = firestoreMockData.data;
}

final List<PlanEntry> testData = [PlanEntry(), PlanEntry()];

void main() {
  setUpAll(() => setupMocks());

  testWidgets(
      '1. When the training plan page is build, a workout table widget is shown.',
      (WidgetTester tester) async {
    await initTableProvider(tester);
    expect(find.byType(WorkoutTable), findsOneWidget);
  });

  testWidgets(
      "2. When the table provider entries are changed, the count is updated accordingly.",
      (WidgetTester tester) async {
    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));

    // required to call listen:false outside of widget tree.
    Provider.of<TableProvider>(context, listen: false).tableEntries = testData;
    expect(
      Provider.of<TableProvider>(context, listen: false).count,
      equals(
        testData.length,
      ),
    );
  });

  testWidgets(
      "3. When the table is initialized, while the database is empty, the table should be empty.",
      (WidgetTester tester) async {
    mockFirestoreService.firestoreMockData.setEmptyMockData();

    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));

    final bool isEmpty =
        Provider.of<TableProvider>(context, listen: false).tableEntries.isEmpty;
    expect(
      isEmpty,
      true,
    );
  });

  testWidgets("4. When the add entry button is tapped, a new entry is added.",
      (WidgetTester tester) async {
    mockFirestoreService.firestoreMockData.setEmptyMockData();
    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));

    final countBefore =
        Provider.of<TableProvider>(context, listen: false).count;

    await tester.tap(find.byType(AddEntryButton));
    await tester.pumpAndSettle();

    expect(
      Provider.of<TableProvider>(context, listen: false).count,
      equals(countBefore + 1),
    );
  });

  testWidgets("5. When the remove entry button is tapped, one entry is removed",
      (WidgetTester tester) async {
    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));

    mockFirestoreService.firestoreMockData.setDefaultMockData();
    final countBefore =
        Provider.of<TableProvider>(context, listen: false).count;

    await tester.tap(find.byType(EntryRemovalButton).first);
    await tester.pumpAndSettle();

    expect(
      Provider.of<TableProvider>(context, listen: false).count,
      equals(countBefore - 1),
    );
  });

  testWidgets(
      "6. Check whether the count and number of entry removal buttons are the same.",
      (WidgetTester tester) async {
    mockFirestoreService.firestoreMockData.setDefaultMockData();

    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));

    final int count = Provider.of<TableProvider>(context, listen: false).count;
    expect(find.byType(EntryRemovalButton), findsNWidgets(count));
  });

  testWidgets(
      "7. Check whether the count and number of entry removal buttons are the same, even after adding entries using the button to add entries. ",
      (WidgetTester tester) async {
    mockFirestoreService.firestoreMockData.setDefaultMockData();

    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));
    await tester.tap(find.byType(AddEntryButton));
    await tester.pumpAndSettle();

    final int count = Provider.of<TableProvider>(context, listen: false).count;
    expect(find.byType(EntryRemovalButton), findsNWidgets(count));
  });

  testWidgets(
      "8. Check whether the count and number of entry removal buttons are the same, even after removing entries using the buttons to delete entries.",
      (WidgetTester tester) async {
    mockFirestoreService.firestoreMockData.setDefaultMockData();

    await initTableProvider(tester);
    final context = tester.element(find.byType(WorkoutTable));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(EntryRemovalButton).first);
    await tester.pumpAndSettle();

    final int count = Provider.of<TableProvider>(context, listen: false).count;
    expect(find.byType(EntryRemovalButton), findsNWidgets(count));
  });
}
