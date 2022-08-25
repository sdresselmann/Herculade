import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';
import 'package:lifting_progress_tracker/data/database.dart';

/// Firebase API Key
const apiKey = 'AIzaSyAAvQNgL2DNb7dT-7UjsJoeV8u8LJWcVhc';

/// Firebase project ID
const projectId = 'lifting-progress-tracker';

void main() {
  Database.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herculade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homeRouteLabel,
      routes: routesObject,
    );
  }
}
