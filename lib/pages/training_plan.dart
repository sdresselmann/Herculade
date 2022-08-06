import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';

const String _title = "Trainingsplan";

class TrainingPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: getNavigationButton(context, exerciseRouteLabel),
    );
  }
}
