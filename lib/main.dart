import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/home.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

void main() {
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
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => HomePage(),
        statisticsRoute: (context) => StatisticsPage(),
        calendarRoute: (context) => CalendarPage(),
        trainingplanListRoute: (context) => TrainingPlanListPage()
      },
    );
  }
}
