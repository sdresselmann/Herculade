import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table_header.dart';

class TrainingPlanTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Training Plan 1"),
        Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                for (final label in tableHeaderLabels)
                  TableHeader(headerText: label),
              ],
            ),
            const TableRow(
              children: [
                Text("Bench press"),
                Text("20 KG"),
                Text("3x15"),
                Text("More Weight next time."),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
            const TableRow(
              children: [
                Text("Deadlift"),
                Text("30/40 KG"),
                Text("3x15/3x5"),
                Text("More Weight next time, slow down execution, ..."),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
            const TableRow(
              children: [
                Text("Overhead Press"),
                Text("10 KG"),
                Text("3x5"),
                Text(""),
                IconButton(
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
