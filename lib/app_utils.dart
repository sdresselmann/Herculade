import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/services/auth_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:logging/logging.dart';

void setupAppUtils() {
  setupLogging();
  setupFirebase();
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

void setupFirebase() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<FirebaseService>(FirebaseService());

  getIt<FirebaseService>()
      .initializeFirebaseApp()
      // authenticate with test user for dev purposes!
      .then((value) => authenticateUser());
}

void authenticateUser() {
  final AuthService authService = AuthService();
  authService.authenticateUser();
}
