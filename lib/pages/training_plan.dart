import 'package:firedart/firedart.dart';
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

    // Only for testing purposes!
    //uploadMockData();
  }

  /// Test function to upload mock data to firebase. Only needed to reset data.
  Future<void> uploadMockData() async {
    final Map<String, dynamic> mockupData = {
      'trainingplan1': {
        '0': {
          'exerciseName': 'Deadlift',
          'weight': '20kg',
          'repeats': '5x6',
        },
        '1': {
          'exerciseName': 'Benchpress',
          'weight': '12.5kg',
          'repeats': '5x10',
        },
        '2': {
          'exerciseName': 'Squats',
          'weight': '10kg',
          'repeats': '3x15',
        }
      },
    };

    await Firestore.instance
        .collection("plan-entries")
        .document("v6g6JVrNR3w5e8TklK4X")
        .update(mockupData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Column(
        children: [
          const NavigationButton(exerciseRouteLabel),
          MultiProvider(
            providers: [ChangeNotifierProvider(create: (_) => TableProvider())],
            child: WorkoutTable(),
          ),
        ],
      ),
    );
  }
}
