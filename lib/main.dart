import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/exercise.dart';
import 'package:lifting_progress_tracker/pages/home.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_day.dart';
import 'package:lifting_progress_tracker/pages/training_period.dart';
import 'package:lifting_progress_tracker/pages/training_plan.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

/// Firebase API Key
const apiKey = 'AIzaSyAAvQNgL2DNb7dT-7UjsJoeV8u8LJWcVhc';

/// Firebase project ID
const projectId = 'lifting-progress-tracker';

void main() {
  // During tests firestore gets initialized multiple times throwing an exception
  Firestore.initialize(projectId);

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
        trainingplanListRoute: (context) => TrainingPlanListPage(),
        trainingDayRoute: (context) => TrainingDayPage(),
        exerciseRoute: (context) => ExercisePage(),
        trainingPeriodRoute: (context) => TrainingPeriodPage(),
        trainingPlanRoute: (context) => TrainingPlanPage(),
      },
    );
  }
}
