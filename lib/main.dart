import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/app.dart';
import 'package:lifting_progress_tracker/services/auth_service.dart';
import 'package:lifting_progress_tracker/services/firebase_service.dart';
import 'package:logging/logging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLogging();
  setupFirebase();

  runApp(
    const MyApp(),
  );
}

void authenticateUser() {
  final AuthService authService = AuthService();
  authService.signInTestUser();
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
