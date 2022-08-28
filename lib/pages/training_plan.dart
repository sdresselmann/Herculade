import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/components/workout_table.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/providers/table_provider.dart';
import 'package:provider/provider.dart';

const String _title = trainingplanListRouteLabel;

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
          const NavigationButton(exerciseRouteLabel),
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => TableProvider(
                  trainingPlanId: "trainingplan1",
                ),
              )
            ],
            child: WorkoutTable(),
          ),
        ],
      ),
    );
  }
}
