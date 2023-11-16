import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';
import 'package:lifting_progress_tracker/services/firebase/firestore_service.dart';

class TrainingPlanService {
  static final TrainingPlanService _instance = TrainingPlanService._();
  final String trainingPlanCollectionName = 'plan-entries';
  final FirestoreService firestoreService = GetIt.instance<FirestoreService>();

  factory TrainingPlanService() {
    return _instance;
  }

  TrainingPlanService._();

  Future<List<PlanEntry>> fetchTrainingPlanData(String trainingPlanId) {
    return firestoreService.getRawData(trainingPlanCollectionName).then(
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
    final Map<String, dynamic> planEntries,
    String trainingPlanId,
  ) async {
    final Map<String, dynamic> trainingPlans = await GetIt.I<FirestoreService>()
        .getRawData(trainingPlanCollectionName);

    trainingPlans[trainingPlanId] = planEntries;
    firestoreService.uploadRawData(trainingPlanCollectionName, trainingPlans);
  }
}
