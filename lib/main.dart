import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/app.dart';
import 'package:lifting_progress_tracker/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(
      environment: "PRODUCTION",
    ),
  );
}
