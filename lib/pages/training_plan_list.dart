import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/widgets/navigation_button.dart';

class TrainingPlanListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavigationButton(trainingPlanRouteLabel),
    );
  }
}
