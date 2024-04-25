import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:lifting_progress_tracker/core/utils/logging.dart';
import 'package:lifting_progress_tracker/core/utils/service_locators.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';

void setupAppUtils() {
  registerLazySingletons();

  setupLogging();
  setup();
}

Future<void> setup() async {
  await GetIt.I.get<FirebaseService>().initializeFirebaseApp();
  setupCurrentUser();
}

Future<void> setupCurrentUser() async {
  final UserService userService = GetIt.I.get<UserService>();
  await userService.initializeUser();
  userService.initUserCollections();
}
