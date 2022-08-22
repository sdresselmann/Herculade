import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/components/workout_table.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';

const String _title = trainingplanListRouteLabel;

class TrainingPlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrainingPlanPageState();
}

class _TrainingPlanPageState extends State<TrainingPlanPage> {
  late final List<PlanEntry> entries;

  @override
  void initState() {
    super.initState();
    entries = [
      PlanEntry(exerciseName: "Deadlift", weight: "20 kg", repeats: "6x5"),
      PlanEntry(exerciseName: "Benchpress", weight: "20 kg", repeats: "6x5"),
      PlanEntry(exerciseName: "Squat", weight: "20 kg", repeats: "6x5"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Column(
        children: [
          const NavigationButton(exerciseRouteLabel),
          WorkoutTable(
            tableEntries: entries,
            // Forces flutter to rebuild element when updating table entries.
            key: Key(entries.length.toString()),
          ),
        ],
      ),
    );
  }
}
