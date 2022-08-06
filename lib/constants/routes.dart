import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/pages/exercise.dart';
import 'package:lifting_progress_tracker/pages/home.dart';
import 'package:lifting_progress_tracker/pages/training_day.dart';
import 'package:lifting_progress_tracker/pages/training_period.dart';
import 'package:lifting_progress_tracker/pages/training_plan.dart';

/// Named string for the home page route.
const String homeRouteLabel = '/';

/// Named string for the statistics page route.
const String statisticsRouteLabel = 'Statistik';

/// Named string for the calendar page route.
const String calendarRouteLabel = "Kalender";

/// Named string for the trainings plan list page route.
const String trainingplanListRouteLabel = "Trainingspläne";

/// Named string for the exercise page route.
const String exerciseRouteLabel = "Übung";

/// Named string for the training day page route.
const String trainingDayRouteLabel = "Trainingstag";

/// Named string for the training period page route.
const String trainingPeriodRouteLabel = "Zeitraum";

/// Named string for the training plan page route.
const String trainingPlanRouteLabel = "Trainingsplan";

/// Routing table for all named routes.
Map<String, Widget Function(BuildContext)> routesObject = {
  homeRouteLabel: (context) => const HomePage(),
  trainingDayRouteLabel: (context) => TrainingDayPage(),
  exerciseRouteLabel: (context) => ExercisePage(),
  trainingPeriodRouteLabel: (context) => TrainingPeriodPage(),
  trainingPlanRouteLabel: (context) => TrainingPlanPage(),
};
