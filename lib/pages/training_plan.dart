import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/core/services/auth_service.dart';
import 'package:lifting_progress_tracker/training_plan/provider/table_provider.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table/workout_table.dart';
import 'package:provider/provider.dart';

const String _title = trainingplanListRouteLabel;

class TrainingPlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrainingPlanPageState();
}

class _TrainingPlanPageState extends State<TrainingPlanPage> {
  final AuthService authService = GetIt.I.get<AuthService>();

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
          Text(authService.getAuthenticatedUserEmail()),
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => TableProvider(
                  trainingPlanId: "trainingplan1",
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
