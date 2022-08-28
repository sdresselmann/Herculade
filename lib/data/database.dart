import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';

import 'package:lifting_progress_tracker/models/plan_entry.dart';

class Database {
  /// The Firebase project Id.
  static const _projectId = 'lifting-progress-tracker';

  /// The database instance for the singleton object.
  static final Database _instance = Database._();

  /// The factory method that returns the already created instance of the database.
  factory Database() {
    return _instance;
  }

  /// The unnamed constructor creating the singleton object when first called.
  Database._();

  /// Initialize the firestore connection to fetch and update data from Firebase.
  ///
  /// See for more information: https://pub.dev/packages/firedart
  static void initialize() {
    try {
      Firestore.initialize(_projectId);
    } catch (firestoreException) {
      debugPrint(firestoreException.toString());
    }
    // Only for testing purposes!
    Database().uploadMockData();
  }

  /// A Test function to upload mock data to Firebase. Only needed to reset data.
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
      'trainingplan2': {},
    };
    final CollectionReference planEntryCollection =
        Firestore.instance.collection('plan-entries');
    planEntryCollection.document("v6g6JVrNR3w5e8TklK4X").update(mockupData);
  }

  /// Fetch all available training plan entries from Firebase.
  ///
  /// Dont call this function as a standalone except when all entries are
  /// needed, since further sorting/filtering is usually required.
  Future<Map<String, dynamic>> fetchAllTrainingPlans() async {
    final CollectionReference planEntryCollection =
        Firestore.instance.collection('plan-entries');

    final Map<String, dynamic> planEntries = await planEntryCollection
        .document("v6g6JVrNR3w5e8TklK4X")
        .get()
        .then((value) => value.map);

    return planEntries;
  }

  /// Fetch a training plan with its entries identified by its [trainingPlanId] from firebase.
  ///
  /// This makes use of the [fetchAllTrainingPlans] function and filters out unwanted entries.
  Future<List<PlanEntry>> fetchTrainingPlanData(String trainingPlanId) async {
    return fetchAllTrainingPlans().then(
      (fetchedEntries) {
        final Map<String, dynamic> currentPlanEntries =
            fetchedEntries[trainingPlanId] as Map<String, dynamic>;

        final List<PlanEntry> entries = [];
        currentPlanEntries.forEach((key, value) {
          entries.add(PlanEntry.fromMap(value as Map<String, dynamic>));
        });
        return entries;
      },
    );
  }

  /// Update the training plan entries with the newly added [planEntries].
  Future<void> updateTrainingPlanData(
    Map<String, dynamic> planEntries,
    String trainingPlanId,
  ) async {
    final Map<String, dynamic> trainingPlans = await fetchAllTrainingPlans();

    trainingPlans[trainingPlanId] = planEntries;

    final CollectionReference planEntryCollection =
        Firestore.instance.collection('plan-entries');
    planEntryCollection.document("v6g6JVrNR3w5e8TklK4X").update(trainingPlans);
  }
}
