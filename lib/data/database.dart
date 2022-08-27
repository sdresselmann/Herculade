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

  /// Test function to upload mock data to firebase. Only needed to reset data.
  Future<void> uploadMockData() async {
    final Map<String, dynamic> mockupData = {
      'trainingplan1': {
        '0': {
          'exerciseName': 'Deadlift',
          'weight': '20kg',
          'repeats': '5x6',
        },
        '1': {
          'exerciseName': 'Benchpress',
          'weight': '12.5kg',
          'repeats': '5x10',
        },
        '2': {
          'exerciseName': 'Squats',
          'weight': '10kg',
          'repeats': '3x15',
        }
      },
    };

    await Firestore.instance
        .collection("plan-entries")
        .document("v6g6JVrNR3w5e8TklK4X")
        .update(mockupData);
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

  /// Update the training plan entries with newly added [planEntries].
  Future<void> updateTrainingPlanData(Map<String, dynamic> planEntries) async {
    final CollectionReference planEntryCollection =
        Firestore.instance.collection('plan-entries');
    planEntryCollection.document("v6g6JVrNR3w5e8TklK4X").update(planEntries);
  }
}
