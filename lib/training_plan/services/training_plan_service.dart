import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/auth/user_service.dart';
import 'package:lifting_progress_tracker/firebase/collection_names.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/firebase/types.dart';
import 'package:lifting_progress_tracker/training_plan/models/plan_entry.dart';

class TrainingPlanService {
  final FirestoreService _firestoreService = GetIt.I.get<FirestoreService>();
  final UserService _userService = GetIt.I.get<UserService>();

  final String trainingPlanCollectionName = CollectionNames.planEntries;

  Future<List<PlanEntry>> fetchTrainingPlanData(String trainingPlanId) async {
    final trainingPlans = await _firestoreService.getRawData(
      trainingPlanCollectionName,
      _userService.user.uid,
    );

    if (trainingPlans == null || trainingPlans.isEmpty) {
      return Future.value([]);
    }

    final Map<String, dynamic> currentPlanEntries =
        trainingPlans[trainingPlanId] as Map<String, dynamic>;

    final List<PlanEntry> entries = [];
    currentPlanEntries.forEach((key, value) {
      entries.add(PlanEntry.fromMap(value as Map<String, dynamic>));
    });
    return entries;
  }

  /// Update the training plan entries with the newly added [planEntries].
  Future<void> updateTrainingPlanData(
    final Map<String, dynamic> planEntries,
    String trainingPlanId,
  ) async {
    final RawFirestoreData? trainingPlans = await _firestoreService.getRawData(
      trainingPlanCollectionName,
      _userService.user.uid,
    );

    if (trainingPlans == null) return;

    trainingPlans[trainingPlanId] = planEntries;
    _firestoreService.uploadRawData(trainingPlanCollectionName, trainingPlans);
  }
}
