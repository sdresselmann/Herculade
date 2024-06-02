import 'package:lifting_progress_tracker/core/interfaces/json_serializable.dart';
import 'package:lifting_progress_tracker/firebase/firestore_json.dart';

class TrainingPlanEntry implements JsonSerializable {
  String repeats;
  String exerciseName;
  String weight;
  String comment;

  TrainingPlanEntry(this.repeats, this.exerciseName, this.weight, this.comment);

  TrainingPlanEntry.fromJson(FirestoreJson json)
      : repeats = json["repeats"] as String,
        exerciseName = json["exerciseName"] as String,
        weight = json["weight"] as String,
        comment = json["comment"] as String;

  @override
  FirestoreJson toJson() {
    return {
      "repeats": repeats,
      "exerciseName": exerciseName,
      "weight": weight,
      "comment": comment,
    };
  }
}
