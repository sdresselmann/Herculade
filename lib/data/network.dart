import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lifting_progress_tracker/types/types.dart';

const String documentReference = 'v6g6JVrNR3w5e8TklK4X';
const String trainingPlanCollectionName = 'plan-entries';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void initialize() {}

Future<RawFirestoreData> getRawTrainingPlanData() async {
  final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await firestore.collection(trainingPlanCollectionName).get();

  final RawFirestoreData planEntries = querySnapshot.docs.first.data();

  return planEntries;
}

/// Updates the already existing training plan data at Firebase.
Future<void> uploadTrainingPlanData(RawFirestoreData trainingPlans) async {
  // firestoreInstance
  //     .collection('plan-entries')
  //     .document("v6g6JVrNR3w5e8TklK4X")
  //     .update(trainingPlans);
}
