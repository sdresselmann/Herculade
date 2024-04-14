import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/utils/logging.dart';
import 'package:lifting_progress_tracker/core/utils/service_locators.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';

void setupAppUtils() {
  registerLazySingletons();

  setupLogging();
  setupFirebase();
}

void setupFirebase() {
  GetIt.I.get<FirebaseService>().initializeFirebaseApp();
  /**.then(
      (value) => {authenticateUser(), initializeUserInformation()},
      ); **/
}
