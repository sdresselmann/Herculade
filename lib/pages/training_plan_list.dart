import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/training_plan_table.dart';

class TrainingPlanListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TrainingPlanTable(),
    );
  }
}
