import 'package:cloud_firestore/cloud_firestore.dart';

typedef RawFirestoreData = Map<String, dynamic>;

const String documentReference = 'v6g6JVrNR3w5e8TklK4X';
const String trainingPlanCollectionName = 'plan-entries';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void initialize() {
  // Only for testing purposes!
  uploadMockData();
}

Future<RawFirestoreData> getRawTrainingPlanData() async {
  // final CollectionReference planEntryCollection =
  //     firestoreInstance.collection(trainingPlanCollectionName);

  // final RawFirestoreData planEntries = await planEntryCollection
  //     .document(documentReference)
  //     .get()
  //     .then((value) => value.map);

  final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await firestore.collection(trainingPlanCollectionName).get();

  final RawFirestoreData planEntries = querySnapshot.docs.first.data();

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
      },
    },
    'trainingplan2': {},
  };

  // firestore.collection(trainingPlanCollectionName).add(mockupData).then(
  //     (DocumentReference doc) =>
  //         print('DocumentSnapshot added with ID: ${doc.id}'));

  // final CollectionReference planEntryCollection =
  //     firestoreInstance.collection(trainingPlanCollectionName);
  // planEntryCollection.document(documentReference).update(mockupData);
}

/// Updates the already existing training plan data at Firebase.
Future<void> uploadTrainingPlanData(RawFirestoreData trainingPlans) async {
  // firestoreInstance
  //     .collection('plan-entries')
  //     .document("v6g6JVrNR3w5e8TklK4X")
  //     .update(trainingPlans);
}
