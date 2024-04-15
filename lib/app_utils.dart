import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/auth/user_service.dart';
import 'package:lifting_progress_tracker/core/utils/logging.dart';
import 'package:lifting_progress_tracker/core/utils/service_locators.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';

void setupAppUtils() {
  registerLazySingletons();

  setupLogging();
  setup();
}

void setup() {
  GetIt.I.get<FirebaseService>().initializeFirebaseApp();
  GetIt.I.get<UserService>().initializeUser();
}
