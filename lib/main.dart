import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';

/// Firebase API Key
const apiKey = 'AIzaSyAAvQNgL2DNb7dT-7UjsJoeV8u8LJWcVhc';

/// Firebase project ID
const projectId = 'lifting-progress-tracker';

void main() {
  // During integration testing firestore gets initialized multiple times throwing an exception
  try {
    Firestore.initialize(projectId);
  } catch (firestoreException) {
    debugPrint(firestoreException.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lifting Progress Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homeRouteLabel,
      routes: routesObject,
    );
  }
}
