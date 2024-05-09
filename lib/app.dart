import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/pages/home/home.dart';
import 'package:lifting_progress_tracker/pages/navigation/navigation_container.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herculade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationContainer(
        initialPage: HomePage(),
      ),
    );
  }
}
