import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/training_plan/models/plan_entry.dart';
import 'package:lifting_progress_tracker/training_plan/services/training_plan_service.dart';

/// A provider used for updating/reading [WorkoutTable] state.
///
/// This provider keeps track of any changes made to the entries inside the
/// table and notifies relevant components.
class TableProvider extends ChangeNotifier {
  final TrainingPlanService trainingPlanService =
      GetIt.I.get<TrainingPlanService>();

  /// The entries inside of the [WorkoutTable].
  late List<PlanEntry> tableEntries = [];

  /// The disposed status off the provider.
  bool _disposed = false;

  /// The current training plan id, which has it's entries displayed
  /// inside the [WorkoutTable].
  final String trainingPlanId;

  /// Create an instance of [TableProvider].
  ///
  /// It uses the [trainingPlanId] to fetch available data from the database
  /// while also keeping them in sync with the local data displayed.
  TableProvider({required this.trainingPlanId}) {
    fetchTableData();
  }

  /// Get table entries for the current training plan.
  void fetchTableData() {
    trainingPlanService.fetchTrainingPlanData().then(
          (fetchedEntries) => {
            for (final fetchedEntry in fetchedEntries)
              {
                tableEntries.add(fetchedEntry),
              },
            notifyListeners(),
          },
        );
  }

  /// The number of entries inside the table.
  int get count => tableEntries.length;

  /// Add an entry to the table.
  void addEntry(PlanEntry tableEntry) {
    tableEntries.add(tableEntry);
    updateTableEntriesData(tableEntries);
    notifyListeners();
  }

  /// Remove an entry from the table.
  void removeEntry(PlanEntry tableEntry) {
    tableEntries.remove(tableEntry);
    updateTableEntriesData(tableEntries);
    notifyListeners();
  }

  /// Update an already existing entry from the table.
  ///
  /// Replaces the [oldPlanEntry] with a [updatedPlanEntry] and updates the
  /// database data accordingly.
  void updateEntry({
    required final PlanEntry oldPlanEntry,
    required final PlanEntry updatedPlanEntry,
  }) {
    final int index = tableEntries.indexOf(oldPlanEntry);
    tableEntries[index] = updatedPlanEntry;
    updateTableEntriesData(tableEntries);
    notifyListeners();
  }

  /// Store the updated [tableEntries] inside the database when the data state changes.
  void updateTableEntriesData(List<PlanEntry> tableEntries) {
    final Map<String, dynamic> tableEntriesMap =
        PlanEntry.getEntriesAsMap(tableEntries);

    trainingPlanService.updateTrainingPlanData(tableEntriesMap, trainingPlanId);
  }

  // Avoids the provider being called by asynchronous functions after it has been disposed.
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
