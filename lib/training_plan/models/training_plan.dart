import 'package:lifting_progress_tracker/firebase/firestore_json.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_entry.dart';

class TrainingPlan {
  Map<String, TrainingPlanEntry> planEntries;

  TrainingPlan({required this.planEntries});

  TrainingPlan.fromJson(FirestoreJson json)
      : planEntries = json.map(
          (key, value) => MapEntry(
            key,
            TrainingPlanEntry.fromJson(value as FirestoreJson),
          ),
        );
}
