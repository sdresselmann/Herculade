import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';

const String documentReference = 'v6g6JVrNR3w5e8TklK4X';
const String trainingPlanCollectionName = 'plan-entries';

/// The Firebase project Id.
const _projectId = 'lifting-progress-tracker';

/// Initialize the firestore connection to fetch and update data from Firebase.
///
/// See for more information: https://pub.dev/packages/firedart
void initialize() {
  try {
    Firestore.initialize(_projectId);
  } catch (firestoreException) {
    debugPrint(firestoreException.toString());
  }
  // Only for testing purposes!
  uploadMockData();
}

/// Fetch all available training plan entries from Firebase and return the raw Data.
///
/// Dont call this function as a standalone except when all entries are
/// needed, since further filtering/ is usually required.
Future<Map<String, dynamic>> getRawTrainingPlanData() async {
  final CollectionReference planEntryCollection =
      Firestore.instance.collection(trainingPlanCollectionName);

  final Map<String, dynamic> planEntries = await planEntryCollection
      .document(documentReference)
      .get()
      .then((value) => value.map);

  return planEntries;
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
      Firestore.instance.collection(trainingPlanCollectionName);
  planEntryCollection.document(documentReference).update(mockupData);
}
