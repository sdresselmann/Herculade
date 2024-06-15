import 'package:collection/collection.dart';
import 'package:lifting_progress_tracker/core/interfaces/json_serializable.dart';
import 'package:lifting_progress_tracker/firebase/firestore_json.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.model.dart';

class TrainingPlanList implements JsonSerializable {
  Map<String, TrainingPlan> trainingPlans;

  TrainingPlanList(this.trainingPlans);

  TrainingPlanList.fromJson(FirestoreJson json)
      : trainingPlans = json.map(
          (key, value) => MapEntry(
            key,
            TrainingPlan.fromJson(value as FirestoreJson),
          ),
        );

  @override
  FirestoreJson toJson() {
    return trainingPlans.map((key, value) => MapEntry(key, value.toJson()));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingPlanList &&
        const MapEquality<String, TrainingPlan>()
            .equals(trainingPlans, other.trainingPlans);
  }

  @override
  int get hashCode =>
      const MapEquality<String, TrainingPlan>().hash(trainingPlans);
}
