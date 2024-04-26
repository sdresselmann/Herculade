import 'package:lifting_progress_tracker/firebase/firestore_json.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.dart';

class TrainingPlanList {
  Map<String, TrainingPlan> trainingPlanList;

  TrainingPlanList({required this.trainingPlanList});

  TrainingPlanList.fromJson(FirestoreJson json)
      : trainingPlanList = json.map(
          (key, value) => MapEntry(
            key,
            TrainingPlan.fromJson(value as FirestoreJson),
          ),
        );

  FirestoreJson toJson() {
    return {
      "trainingPlanList": trainingPlanList,
    };
  }
}
