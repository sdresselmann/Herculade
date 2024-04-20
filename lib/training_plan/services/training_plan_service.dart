import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/auth/user_service.dart';
import 'package:lifting_progress_tracker/firebase/constants/collection_names.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/firebase/types.dart';
import 'package:lifting_progress_tracker/training_plan/models/plan_entry.dart';
import 'package:logging/logging.dart';

class TrainingPlanService {
  final FirestoreService _firestoreService = GetIt.I.get<FirestoreService>();
  final UserService _userService = GetIt.I.get<UserService>();

  final String trainingPlanCollectionName = CollectionNames.planEntries;

  final _logger = Logger("TrainingPlanService");

  Future<List<PlanEntry>> fetchTrainingPlanData() async {
    final user = _userService.user;

    final RawFirestoreData? trainingPlans = await _firestoreService.getRawData(
      trainingPlanCollectionName,
      user.uid,
    );

    if (trainingPlans == null || trainingPlans.isEmpty) {
      _logger.warning("Training plan data is null or empty.");
      return Future.value([]);
    }

    // extract training plan 1 for dev purposes atm, make it dynamic later ( quick and dirty fix)
    final Map<String, dynamic> currentPlanEntries =
        trainingPlans["trainingplan1"] as Map<String, dynamic>;

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
    final user = _userService.user;
    final RawFirestoreData? trainingPlans = await _firestoreService.getRawData(
      trainingPlanCollectionName,
      user.uid,
    );

    if (trainingPlans == null) return;

    trainingPlans[trainingPlanId] = planEntries;
    _firestoreService.uploadRawData(trainingPlanCollectionName, trainingPlans);
  }
}
