import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/data/database.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';

/// A provider used for updating/reading [WorkoutTable] state.
///
/// This provider keeps track of any changes made to the entries inside the
/// table and notifies relevant components.
class TableProvider extends ChangeNotifier {
  /// The entries inside of the [WorkoutTable].
  final List<PlanEntry> _tableEntries = [];

  /// The current training plan id, which has it's entries displayed
  /// inside the [WorkoutTable].
  final String trainingPlanId;

  /// A provider used for updating/reading [WorkoutTable] state.
  ///
  /// This provider keeps track of any changes made to the entries inside the
  /// table and notifies relevant components.
  /// It uses the [trainingPlanId] to fetch available data from the database
  /// while also keeping them in synch with the local data displayed.
  TableProvider({required this.trainingPlanId}) {
    Database().fetchTrainingPlanData(trainingPlanId).then(
          (fetchedEntries) => {
            for (final fetchedEntry in fetchedEntries)
              {
                _tableEntries.add(fetchedEntry),
              },
            notifyListeners(),
          },
        );
  }

  /// The number of entries inside the table.
  int get count => _tableEntries.length;

  /// The list of entries inside the table.
  List<PlanEntry> get tableEntries => _tableEntries;

  /// Add an entry to the table.
  void addEntry(PlanEntry tableEntry) {
    _tableEntries.add(tableEntry);
    updateTableEntriesData(tableEntries);
    notifyListeners();
  }

  /// Remove an entry from the table.
  void removeEntry(PlanEntry tableEntry) {
    _tableEntries.remove(tableEntry);
    updateTableEntriesData(tableEntries);
    notifyListeners();
  }

  void updateEntry() {
    updateTableEntriesData(_tableEntries);
    notifyListeners();
  }

  /// Store the updated [tableEntries] inside the database when the data state changes.
  void updateTableEntriesData(List<PlanEntry> tableEntries) {
    final Map<String, dynamic> tableEntriesMap =
        PlanEntry.getEntriesAsMap(tableEntries);
    Database().updateTrainingPlanData(tableEntriesMap, trainingPlanId);
  }
}
