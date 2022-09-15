import 'package:lifting_progress_tracker/data/network.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';

class TrainingPlanRepository {
  /// The database instance for the singleton object.
  static final TrainingPlanRepository _instance = TrainingPlanRepository._();

  /// The factory method that returns the already created instance of the database.
  factory TrainingPlanRepository() {
    initialize();
    return _instance;
  }

  /// The unnamed constructor creating the singleton object when first called.
  TrainingPlanRepository._();

  /// Fetch a training plan with its entries identified by its [trainingPlanId] from Firebase.
  ///
  /// This makes use of the [getRawTrainingPlanData] function and filters out unwanted entries.
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
