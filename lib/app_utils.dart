import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/auth/user_service.dart';
import 'package:lifting_progress_tracker/core/utils/logging.dart';
import 'package:lifting_progress_tracker/core/utils/service_locators.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';

Future<void> setupAppUtils() async {
  registerLazySingletons();

  setupLogging();
  await setup();
}

Future<void> setup() async {
  await GetIt.I.get<FirebaseService>().initializeFirebaseApp();
  await GetIt.I.get<UserService>().initializeUser();
}