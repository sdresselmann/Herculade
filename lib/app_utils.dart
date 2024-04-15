import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/services/auth_service.dart';
import 'package:lifting_progress_tracker/core/utils/logging.dart';
import 'package:lifting_progress_tracker/core/utils/service_locators.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';

void setupAppUtils() {
  registerLazySingletons();

  setupLogging();
  setupFirebase();
}

Future<void> setupFirebase() async {
  GetIt.I.get<FirebaseService>().initializeFirebaseApp();
  GetIt.I.get<AuthService>().authenticateUser();
  // GetIt.I.get<UserService>().initializeCurrentUser();
  /**.then(
      (value) => {authenticateUser(), initializeUserInformation()},
      ); **/
}
