import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/training_plan/default_training_plan_data.dart';
import 'package:lifting_progress_tracker/training_plan/provider/table_provider.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table/workout_table.dart';
import 'package:provider/provider.dart';

const String _title = trainingPlanListRouteLabel;

class TrainingPlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrainingPlanPageState();
}

class _TrainingPlanPageState extends State<TrainingPlanPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Column(
        children: [
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => TableProvider(
                  trainingPlanId: trainingPlanId,
                ),
              ),
            ],
            child: WorkoutTable(),
          ),
        ],
      ),
    );
  }
}
