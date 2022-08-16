import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';

class WorkoutTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkoutTableState();
}

class _WorkoutTableState extends State<WorkoutTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: workoutTable,
    );
  }
}

TableRow _tableHeader = TableRow(
  children: <TableCell>[
    TableCell(
      child: Text(tableHeaderLabels.elementAt(0)),
    ),
    TableCell(
      child: Text(tableHeaderLabels.elementAt(1)),
    ),
    TableCell(
      child: Text(tableHeaderLabels.elementAt(2)),
    ),
  ],
);

/// Table containing plan entries for every workout.
Table workoutTable = Table(
  border: TableBorder.all(),
  children: <TableRow>[
    _tableHeader,
    TableRow(
      children: <TableCell>[
        TableCell(
          child: EditableText(
            controller: TextEditingController(),
            cursorColor: Colors.white,
            focusNode: FocusNode(),
            style: const TextStyle(color: Colors.black),
            backgroundCursorColor: Colors.grey,
          ),
        ),
        const TableCell(
          child: Text('20 kg'),
        ),
        const TableCell(
          child: Text('5x15'),
        ),
      ],
    )
  ],
);
