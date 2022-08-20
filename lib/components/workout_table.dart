import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/table_text_field.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';

const _headerStyle = TextStyle(fontWeight: FontWeight.bold);

/// First row of the table containing all column titles.
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

/// Table widget used to displaying the training plan/workout plan data.
///
/// The table data is filled up with [tableEntries] that can be manipulated later by
/// the user.
class WorkoutTable extends StatefulWidget {
  /// Entries inside the table.
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
            for (final PlanEntry entry in widget.tableEntries)
              TableRow(
                children: <TableCell>[
                  TableCell(
                    child: TableTextField(
                      textFieldValue: entry.exerciseName,
                      onEditingComplete: (String newValue) => {
                        setState(() {
                          entry.exerciseName = newValue;
                        })
                      },
                    ),
                  ),
                  TableCell(
                    child: TableTextField(
                      textFieldValue: entry.weight,
                      onEditingComplete: (String newValue) => {
                        setState(() {
                          entry.weight = newValue;
                        })
                      },
                    ),
                  ),
                  TableCell(
                    child: TableTextField(
                      textFieldValue: entry.repeats,
                      onEditingComplete: (String newValue) => {
                        setState(() {
                          entry.repeats = newValue;
                        })
                      },
                    ),
                  ),
                  TableCell(
                    child: _EntryRemovalButton(() {
                      setState(() {
                        widget.tableEntries.remove(entry);
                      });
                    }),
                  )
                ],
              )
          ],
        ),
        _addEntryButton
      ],
    );
  }

  /// Button for adding entries to the table.
  late final ElevatedButton _addEntryButton = ElevatedButton(
    onPressed: () => {
      setState(() {
        widget.tableEntries.add(
          PlanEntry(),
        );
      })
    },
    child: const Text(" + "),
  );
}

/// Creates a Button that when clicked removes its corresponding [tableEntry].
class _EntryRemovalButton extends StatelessWidget {
  final void Function()? onPressed;

  const _EntryRemovalButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text(" - "));
  }
}
