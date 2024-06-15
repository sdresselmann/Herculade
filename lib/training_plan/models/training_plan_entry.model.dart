import 'package:lifting_progress_tracker/core/interfaces/json_serializable.dart';
import 'package:lifting_progress_tracker/firebase/firestore_json.dart';

class TrainingPlanEntry implements JsonSerializable {
  String exerciseName;
  String weight;
  String repeats;
  String comment;

  TrainingPlanEntry(this.exerciseName, this.weight, this.repeats, this.comment);

  TrainingPlanEntry.fromJson(FirestoreJson json)
      : exerciseName = json["exerciseName"] as String,
        weight = json["weight"] as String,
        repeats = json["repeats"] as String,
        comment = json["comment"] as String;

  @override
  FirestoreJson toJson() {
    return {
      "exerciseName": exerciseName,
      "weight": weight,
      "repeats": repeats,
      "comment": comment,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingPlanEntry &&
        exerciseName == other.exerciseName &&
        weight == other.weight &&
        repeats == other.repeats &&
        comment == other.comment;
  }

  @override
  int get hashCode =>
      exerciseName.hashCode ^
      weight.hashCode ^
      repeats.hashCode ^
      comment.hashCode;
}
