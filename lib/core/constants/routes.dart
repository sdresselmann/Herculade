import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/pages/exercise.dart';
import 'package:lifting_progress_tracker/pages/starting/router_outlet.dart';
import 'package:lifting_progress_tracker/pages/training_day.dart';
import 'package:lifting_progress_tracker/pages/training_period.dart';

Map<String, Widget Function(BuildContext)> routesObject = {
  routerOutletLabel: (context) => const RouterOutlet(),
  trainingDayRouteLabel: (context) => TrainingDayPage(),
  exerciseRouteLabel: (context) => ExercisePage(),
  trainingPeriodRouteLabel: (context) => TrainingPeriodPage(),
};
