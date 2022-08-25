import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';

import 'package:lifting_progress_tracker/models/plan_entry.dart';

class Database {
  /// Firebase project ID
  static const _projectId = 'lifting-progress-tracker';

  static final Database _instance = Database._();

  factory Database() {
    return _instance;
  }
  Database._();

  static void initialize() {
    try {
      Firestore.initialize(_projectId);
    } catch (firestoreException) {
      debugPrint(firestoreException.toString());
    }
  }

  /// Fetch [entries] for the current training plan from firebase.
  Future<List<PlanEntry>> fetchTrainingPlanData() async {
    final CollectionReference planEntryCollection =
        Firestore.instance.collection('plan-entries');

    final Map<String, dynamic> planEntries = await planEntryCollection
        .document("v6g6JVrNR3w5e8TklK4X")
        .get()
        .then((value) => value.map);

    final Map<String, dynamic> currentPlanEntries =
        planEntries['trainingplan1'] as Map<String, dynamic>;

    final List<PlanEntry> entries = [];
    currentPlanEntries.forEach((key, value) {
      entries.add(PlanEntry.fromMap(value as Map<String, dynamic>));
    });

    return entries;
  }
}
