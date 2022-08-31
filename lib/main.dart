import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';

void main() {
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
