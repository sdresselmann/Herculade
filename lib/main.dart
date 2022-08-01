import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';
import 'package:lifting_progress_tracker/firebase_options.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/exercise.dart';
import 'package:lifting_progress_tracker/pages/home.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_day.dart';
import 'package:lifting_progress_tracker/pages/training_period.dart';
import 'package:lifting_progress_tracker/pages/training_plan.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
