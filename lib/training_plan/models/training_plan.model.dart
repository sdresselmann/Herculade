import 'package:collection/collection.dart';
import 'package:lifting_progress_tracker/core/interfaces/json_serializable.dart';
import 'package:lifting_progress_tracker/firebase/firestore_json.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_entry.model.dart';
import 'package:uuid/uuid.dart';

class TrainingPlan implements JsonSerializable {
  String id = const Uuid().v1();
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingPlan &&
        const MapEquality<String, TrainingPlanEntry>()
            .equals(planEntries, other.planEntries);
  }

  @override
  int get hashCode =>
      const MapEquality<String, TrainingPlanEntry>().hash(planEntries);
}
