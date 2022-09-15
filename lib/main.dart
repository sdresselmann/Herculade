import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';
import 'package:lifting_progress_tracker/providers/environment_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(
      environment: "PRODUCTION",
    ),
  );
}

class MyApp extends StatelessWidget {
  /// The environment the app is called. For example: RELEASE, PRODUCTION or TEST.
  ///
  /// In test mode data is not fetched from firebase and has to be mocked instead.
  /// For backend testing use DATATEST which uses a special test database.
  final String environment;
  const MyApp({Key? key, required this.environment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => EnvironmentProvider(environment: environment),
      child: MaterialApp(
        title: 'Herculade',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: homeRouteLabel,
        routes: routesObject,
      ),
    );
  }
}
