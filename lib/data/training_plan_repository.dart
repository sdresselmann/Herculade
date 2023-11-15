import 'package:lifting_progress_tracker/data/network.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';

class TrainingPlanRepository {
  static final TrainingPlanRepository _instance = TrainingPlanRepository._();

  factory TrainingPlanRepository() {
    initialize();
    return _instance;
  }

  TrainingPlanRepository._();

  Future<List<PlanEntry>> fetchTrainingPlanData(String trainingPlanId) {
    return getRawTrainingPlanData().then(
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
    final Map<String, dynamic> trainingPlans = await getRawTrainingPlanData();

    trainingPlans[trainingPlanId] = planEntries;
    uploadTrainingPlanData(trainingPlans);
  }
}
