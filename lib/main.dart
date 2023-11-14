import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/app.dart';
import 'package:lifting_progress_tracker/config/auth_config.dart';
import 'package:lifting_progress_tracker/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await signInTestUser();

  runApp(
    const MyApp(
      environment: "PRODUCTION",
    ),
  );
}

Future<void> signInTestUser() async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  try {
    final UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: AuthConfig.testUserEmail,
      password: AuthConfig.testUserPassword,
    );
    print("Signed in: ${userCredential.user!.email}");
  } catch (e) {
    print("Error signing in: $e");
  }
}
