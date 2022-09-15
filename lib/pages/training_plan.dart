import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/workout_table.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/providers/environment_provider.dart';
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
    final bool environmentIsProd =
        Provider.of<EnvironmentProvider>(context, listen: false).environment ==
            'PRODUCTION';

    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Column(
        children: [
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => TableProvider(
                  trainingPlanId: "trainingplan1",
                  fetchEntries: environmentIsProd,
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
