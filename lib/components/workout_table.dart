import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';

const _headerStyle = TextStyle(fontWeight: FontWeight.bold);

final TableRow _tableHeader = TableRow(
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

class WorkoutTable extends StatefulWidget {
  final List<PlanEntry> tableEntries;
  const WorkoutTable({required this.tableEntries});

  @override
  State<WorkoutTable> createState() => _WorkoutTableState();
}

class _WorkoutTableState extends State<WorkoutTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.all(),
          children: <TableRow>[
            _tableHeader,
            for (var item in widget.tableEntries)
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
                      onPressed: () => {
                        setState(() {
                          widget.tableEntries.remove(item);
                        })
                      },
                    ),
                  )
                ],
              )
          ],
        ),
        ElevatedButton(
          onPressed: () => {
            setState(() {
              widget.tableEntries.add(
                PlanEntry(
                  exerciseName: "exerciseName",
                  weight: "weight",
                  repeats: "repeats",
                ),
              );
            })
          },
          child: const Text(" + "),
        )
      ],
    );
  }
}
