import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/core/constants/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herculade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: routerOutletLabel,
      routes: routesObject,
    );
  }
}
