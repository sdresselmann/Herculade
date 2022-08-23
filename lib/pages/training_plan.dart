import 'package:firedart/firedart.dart';
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
  late CollectionReference planEntryCollection;

  @override
  void initState() {
    super.initState();
    entries = [];
    planEntryCollection = Firestore.instance.collection('plan-entries');
    // Only for testing purposes!
    //uploadMockData();

    fetchTrainingPlanData().then((value) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  /// Fetch [entries] for the current training plan from firebase.
  Future<void> fetchTrainingPlanData() async {
    final Map<String, dynamic> planEntries = await planEntryCollection
        .document("v6g6JVrNR3w5e8TklK4X")
        .get()
        .then((value) => value.map);

    final Map<String, dynamic> currentPlanEntries =
        planEntries['trainingplan1'] as Map<String, dynamic>;

    currentPlanEntries.forEach((key, value) {
      entries.add(PlanEntry.fromMap(value as Map<String, dynamic>));
    });
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
