import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table_header.dart';

class SelectedTrainingPlan extends StatefulWidget {
  final TrainingPlan currentPlan;

  const SelectedTrainingPlan({required this.currentPlan});

  @override
  State<StatefulWidget> createState() => _SelectedTrainingPlanState();
}

class _SelectedTrainingPlanState extends State<SelectedTrainingPlan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                for (final label in tableHeaderLabels)
                  TableHeader(headerText: label),
              ],
            ),
            for (final entry in widget.currentPlan.planEntries.entries)
              TableRow(
                children: [
                  Text(entry.value.exerciseName),
                  Text(entry.value.weight),
                  Text(entry.value.repeats),
                  Text(entry.value.comment),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
          ],
        ),
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.create),
        ),
      ],
    );
  }
}
