import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/models/plan_entry.dart';

class TrainingPlanService {
  static final TrainingPlanService _instance = TrainingPlanService._();
  final String trainingPlanCollectionName = 'plan-entries';
  late FirestoreService firestoreService;

  factory TrainingPlanService() {
    return _instance;
  }

  TrainingPlanService._() {
    firestoreService = GetIt.instance<FirestoreService>();
  }

  Future<List<PlanEntry>> fetchTrainingPlanData(String trainingPlanId) {
    return firestoreService.getRawData(trainingPlanCollectionName).then(
      (fetchedEntries) {
        if (fetchedEntries.isEmpty) {
          return Future.value([]);
        }

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
