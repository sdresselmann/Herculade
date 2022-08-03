import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/exercise.dart';
import 'package:lifting_progress_tracker/pages/home.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_day.dart';
import 'package:lifting_progress_tracker/pages/training_period.dart';
import 'package:lifting_progress_tracker/pages/training_plan.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

/// Named string for the home page route.
const String homeRoute = '/';

/// Named string for the statistics page route.
const String statisticsRoute = 'Statistik';

/// Named string for the calendar page route.
const String calendarRoute = "Kalender";

/// Named string for the trainings plan list page route.
const String trainingplanListRoute = "Trainingspläne";

/// Named string for the exercise page route.
const String exerciseRoute = "Übung";

/// Named string for the training day page route.
const String trainingDayRoute = "Trainingstag";

/// Named string for the training period page route.
const String trainingPeriodRoute = "Zeitraum";

/// Named string for the training plan page route.
const String trainingPlanRoute = "Trainingsplan";

/// Routing table for all named routes.
Map<String, Widget Function(BuildContext)> routesObject = {
  homeRoute: (context) => HomePage(),
  statisticsRoute: (context) => StatisticsPage(),
  calendarRoute: (context) => CalendarPage(),
  trainingplanListRoute: (context) => TrainingPlanListPage(),
  trainingDayRoute: (context) => TrainingDayPage(),
  exerciseRoute: (context) => ExercisePage(),
  trainingPeriodRoute: (context) => TrainingPeriodPage(),
  trainingPlanRoute: (context) => TrainingPlanPage(),
};
