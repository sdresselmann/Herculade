import 'package:flutter_test/flutter_test.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';
import 'package:lifting_progress_tracker/providers/table_provider.dart';
import 'package:lifting_progress_tracker/widgets/table/workout_table.dart';
import 'package:provider/provider.dart';

final List<PlanEntry> testData = [PlanEntry(), PlanEntry()];

Future<void> setTableProviderData(WidgetTester tester) async {
  final context = tester.element(find.byType(WorkoutTable));
  Provider.of<TableProvider>(context, listen: false).tableEntries = testData;
}

Future<int> getTableEntryCount(WidgetTester tester) async {
  final context = tester.element(find.byType(WorkoutTable));
  return Provider.of<TableProvider>(context, listen: false).count;
}
