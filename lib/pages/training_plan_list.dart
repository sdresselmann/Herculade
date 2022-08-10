import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';

class TrainingPlanListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavigationButton(trainingPlanRouteLabel),
    );
  }
}
