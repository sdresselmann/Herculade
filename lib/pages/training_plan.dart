import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';

const String _title = trainingplanListRouteLabel;

/// Table containing plan entries for every workout.
Table workoutTable = Table(
  border: TableBorder.all(),
  children: const <TableRow>[
    TableRow(
      children: <TableCell>[
        TableCell(
          child: Text('Exercise'),
        ),
        TableCell(
          child: Text('Weight'),
        ),
        TableCell(
          child: Text('Repeats'),
        ),
      ],
    ),
    TableRow(
      children: <TableCell>[
        TableCell(
          child: Text('Deadlifts'),
        ),
        TableCell(
          child: Text('20 kg'),
        ),
        TableCell(
          child: Text('5x15'),
        ),
      ],
    )
  ],
);

class TrainingPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Column(
        children: [
          const NavigationButton(exerciseRouteLabel),
          workoutTable,
        ],
      ),
    );
  }
}
