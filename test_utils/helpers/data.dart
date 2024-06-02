import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/services/user.service.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';

import '../mocks/firebase_mock.service.dart';
import '../mocks/firestore_mock.service.dart';
import '../mocks/user_mock.service.dart';

void connectToMockDatabase() {
  Get.put<FirebaseService>(MockFirebaseService());
  Get.put<FirestoreService>(MockFirestoreService());
}

void setUserService() {
  Get.put<UserService>(UserMockService());
}
