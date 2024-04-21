import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';

import '../mocks/firebase_mock_service.dart';
import '../mocks/firestore_mock_service.dart';
import '../mocks/user_mock_service.dart';

void connectToMockDatabase() {
  GetIt.I.registerSingleton<FirebaseService>(MockFirebaseService());
  GetIt.I.registerSingleton<FirestoreService>(MockFirestoreService());
}

void setCurrentUser() {
  GetIt.I.registerSingleton<UserService>(UserMockService());
}
