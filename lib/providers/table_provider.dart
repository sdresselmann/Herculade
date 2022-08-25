import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';

class TableProvider extends ChangeNotifier {
  final List<PlanEntry> _tableEntries;

  TableProvider(this._tableEntries);

  int get count => tableEntries.length;
  List<PlanEntry> get tableEntries => _tableEntries;

  void addEntry(PlanEntry tableEntry) {
    _tableEntries.add(tableEntry);
    notifyListeners();
  }
}
