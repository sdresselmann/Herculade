import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_list.dart';

class TrainingPlanService {
  final FirestoreService _firestoreService = GetIt.I.get<FirestoreService>();

  Future<TrainingPlanList> get(
    String collectionName,
    String documentId,
  ) async {
    return TrainingPlanList.fromJson(
      await _firestoreService.get(collectionName, documentId),
    );
  }
}
