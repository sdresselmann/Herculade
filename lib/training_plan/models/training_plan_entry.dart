import 'package:lifting_progress_tracker/firebase/firestore_json.dart';

class TrainingPlanEntry {
  String repeats;
  String exerciseName;
  String weight;

  TrainingPlanEntry({
    required this.repeats,
    required this.exerciseName,
    required this.weight,
  });

  TrainingPlanEntry.fromJson(FirestoreJson json)
      : repeats = json["repeats"] as String,
        exerciseName = json["exerciseName"] as String,
        weight = json["weight"] as String;

  FirestoreJson toJson() {
    return {
      "repeats": repeats,
      "exerciseName": exerciseName,
      "weight": weight,
    };
  }
}
