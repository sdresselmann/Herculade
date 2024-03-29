import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/pages/exercise.dart';
import 'package:lifting_progress_tracker/pages/home.dart';
import 'package:lifting_progress_tracker/pages/training_day.dart';
import 'package:lifting_progress_tracker/pages/training_period.dart';
import 'package:lifting_progress_tracker/pages/training_plan.dart';

Map<String, Widget Function(BuildContext)> routesObject = {
  homeRouteLabel: (context) => const HomePage(),
  trainingDayRouteLabel: (context) => TrainingDayPage(),
  exerciseRouteLabel: (context) => ExercisePage(),
  trainingPeriodRouteLabel: (context) => TrainingPeriodPage(),
  trainingPlanRouteLabel: (context) => TrainingPlanPage(),
};
