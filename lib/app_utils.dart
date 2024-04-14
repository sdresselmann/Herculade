import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/services/auth_service.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:lifting_progress_tracker/core/utils/logging.dart';
import 'package:lifting_progress_tracker/core/utils/service_locators.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';

void setupAppUtils() {
  registerLazySingletons();

  setupLogging();
  setupFirebase();
}

void setupFirebase() {
  FirebaseService()
      .initializeFirebaseApp()
      // authenticate with test user for dev purposes!
      .then(
        (value) => {authenticateUser(), initializeUserInformation()},
      );
}

void authenticateUser() {
  GetIt.I.get<AuthService>().authenticateUser();
}

void initializeUserInformation() {
  GetIt.I.get<UserService>().initializeCurrentUser();
}
