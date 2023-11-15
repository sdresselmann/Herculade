import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/app.dart';
import 'package:lifting_progress_tracker/services/firebase_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final FirebaseService firebaseService = FirebaseService();
  firebaseService.initializeFirebaseApp();

  runApp(
    const MyApp(),
  );
}
