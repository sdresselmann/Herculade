import 'package:lifting_progress_tracker/core/interfaces/json_serializable.dart';
import 'package:lifting_progress_tracker/firebase/firestore_json.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_entry.dart';

class TrainingPlan implements JsonSerializable {
  Map<String, TrainingPlanEntry> planEntries;

  TrainingPlan(this.planEntries);

  TrainingPlan.fromJson(FirestoreJson json)
      : planEntries = json.map(
          (key, value) => MapEntry(
            key,
            TrainingPlanEntry.fromJson(value as FirestoreJson),
          ),
        );

  @override
  FirestoreJson toJson() {
    return planEntries.map((key, value) => MapEntry(key, value.toJson()));
  }
}
