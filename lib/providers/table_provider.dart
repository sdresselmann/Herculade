import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/data/database.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';

class TableProvider extends ChangeNotifier {
  final List<PlanEntry> _tableEntries = [];

  TableProvider() {
    Database().fetchTrainingPlanData().then(
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

    notifyListeners();
  }

  void removeEntry(PlanEntry tableEntry) {
    _tableEntries.remove(tableEntry);
    notifyListeners();
  }
}

/// Store the updated table entries inside the database when the data state changes.
void updateTableEntriesData(List<PlanEntry> tableEntries) {
  PlanEntry.getEntriesAsMap(tableEntries);
}
