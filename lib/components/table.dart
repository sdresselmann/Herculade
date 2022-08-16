import 'package:flutter/material.dart';

class WorkoutTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkoutTableState();
}

class _WorkoutTableState extends State<WorkoutTable> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

/// Table containing plan entries for every workout.
Table workoutTable = Table(
  border: TableBorder.all(),
  children: <TableRow>[
    const TableRow(
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
