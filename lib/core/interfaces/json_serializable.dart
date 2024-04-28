import 'package:lifting_progress_tracker/firebase/firestore_json.dart';

abstract class JsonSerializable {
  // Usage of named constructors can't be enforced, however the usage of
  // both methods is heavily encouraged.
  JsonSerializable.fromJson();

  FirestoreJson toJson() {
    return {};
  }
}
