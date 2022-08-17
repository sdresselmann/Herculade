import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';

class WorkoutTable extends StatelessWidget {
  final List<PlanEntry> tableEntries;
  const WorkoutTable({required this.tableEntries});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: <TableRow>[
        _tableHeader,
        for (var item in tableEntries)
          TableRow(
            children: <TableCell>[
              TableCell(
                child: Text(item.exerciseName),
              ),
              TableCell(child: Text(item.weight)),
              TableCell(child: Text(item.repeats)),
              TableCell(
                child: ElevatedButton(
                  child: const Text("-"),
                  onPressed: () => {tableEntries.remove(item)},
                ),
              )
            ],
          )
      ],
    );
  }

  static final TableRow _tableHeader = TableRow(
    children: <TableCell>[
      TableCell(
        child: Text(
          tableHeaderLabels.elementAt(0),
          style: _headerStyle,
        ),
      ),
      TableCell(
        child: Text(
          tableHeaderLabels.elementAt(1),
          style: _headerStyle,
        ),
      ),
      TableCell(
        child: Text(
          tableHeaderLabels.elementAt(2),
          style: _headerStyle,
        ),
      ),
      //Column for removal buttons.
      const TableCell(child: Text(" "))
    ],
  );
}

const _headerStyle = TextStyle(fontWeight: FontWeight.bold);
