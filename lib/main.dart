import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/app.dart';
import 'package:lifting_progress_tracker/services/firebase_service.dart';
import 'package:logging/logging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  final FirebaseService firebaseService = FirebaseService();
  firebaseService.initializeFirebaseApp();

  runApp(
    const MyApp(),
  );
}
