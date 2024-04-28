import 'package:lifting_progress_tracker/core/interfaces/json_serializable.dart';
import 'package:lifting_progress_tracker/firebase/firestore_json.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.dart';

class TrainingPlanList implements JsonSerializable {
  Map<String, TrainingPlan> trainingPlanList;

  TrainingPlanList(this.trainingPlanList);

  TrainingPlanList.fromJson(FirestoreJson json)
      : trainingPlanList = json.map(
          (key, value) => MapEntry(
            key,
            TrainingPlan.fromJson(value as FirestoreJson),
          ),
        );

  @override
  FirestoreJson toJson() {
    return {
      "trainingPlanList": trainingPlanList,
    };
  }
}
