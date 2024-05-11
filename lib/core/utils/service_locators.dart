import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';

void registerLazySingletons() {
  Get.lazyPut(() => FirebaseService());
  Get.lazyPut(() => FirestoreService());
  Get.lazyPut(() => UserService());
}
