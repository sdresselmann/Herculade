import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/data/database.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';

class TableProvider extends ChangeNotifier {
  final List<PlanEntry> _tableEntries = [];
  final String trainingPlanId;

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

  int get count => _tableEntries.length;
  List<PlanEntry> get tableEntries => _tableEntries;

  void addEntry(PlanEntry tableEntry) {
    _tableEntries.add(tableEntry);
    updateTableEntriesData(tableEntries);
    notifyListeners();
  }

  void removeEntry(PlanEntry tableEntry) {
    _tableEntries.remove(tableEntry);
    updateTableEntriesData(tableEntries);
    notifyListeners();
  }

  /// Store the updated [tableEntries] inside the database when the data state changes.
  void updateTableEntriesData(List<PlanEntry> tableEntries) {
    final Map<String, dynamic> tableEntriesMap =
        PlanEntry.getEntriesAsMap(tableEntries);
    Database().updateTrainingPlanData(tableEntriesMap, trainingPlanId);
  }
}
