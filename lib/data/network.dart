import 'package:firedart/firedart.dart';

/// Raw Firestore data type as required by documentation.
typedef RawFirestoreData = Map<String, dynamic>;

/// The Firestore cloud document reference name.
const String documentReference = 'v6g6JVrNR3w5e8TklK4X';

/// The Firestore cloud collection name for the stored training plans.
const String trainingPlanCollectionName = 'plan-entries';

/// The Firebase project Id.
const _projectId = 'lifting-progress-tracker';

/// The current firestore instance.
///
/// Calls to the database should always be done via this attribute to avoid having multiple instances.
Firestore firestoreInstance = Firestore.initialize(_projectId);

/// Initialize the Firestore connection to fetch and update data from Firebase.
///
/// See for more information: https://pub.dev/packages/firedart
void initialize() {
  // Only for testing purposes!
  uploadMockData();
}

/// Fetch all available training plan entries from Firebase and return the raw data.
///
/// Dont call this function as a standalone except when all entries are
/// needed, since further filtering/ is usually required.
Future<RawFirestoreData> getRawTrainingPlanData() async {
  final CollectionReference planEntryCollection =
      firestoreInstance.collection(trainingPlanCollectionName);

  final RawFirestoreData planEntries = await planEntryCollection
      .document(documentReference)
      .get()
      .then((value) => value.map);

  return planEntries;
}

/// A Test function to upload mock data to Firebase. Only needed to reset data.
Future<void> uploadMockData() async {
  final RawFirestoreData mockupData = {
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
      firestoreInstance.collection(trainingPlanCollectionName);
  planEntryCollection.document(documentReference).update(mockupData);
}

/// Updates the already existing training plan data at Firebase.
Future<void> uploadTrainingPlanData(RawFirestoreData trainingPlans) async {
  firestoreInstance
      .collection('plan-entries')
      .document("v6g6JVrNR3w5e8TklK4X")
      .update(trainingPlans);
}
