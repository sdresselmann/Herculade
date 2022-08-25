import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/table_text_field.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';
import 'package:lifting_progress_tracker/providers/table_provider.dart';
import 'package:provider/provider.dart';

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
class WorkoutTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.all(),
          children: <TableRow>[
            _tableHeader,
            for (final PlanEntry entry
                in context.watch<TableProvider>().tableEntries)
              TableRow(
                children: <TableCell>[
                  TableCell(
                    child: TableTextField(
                      key: UniqueKey(),
                      textFieldValue: entry.exerciseName,
                      onEditingComplete: (String newValue) =>
                          {entry.exerciseName = newValue},
                    ),
                  ),
                  TableCell(
                    child: TableTextField(
                      key: UniqueKey(),
                      textFieldValue: entry.weight,
                      onEditingComplete: (String newValue) =>
                          {entry.weight = newValue},
                    ),
                  ),
                  TableCell(
                    child: TableTextField(
                      key: UniqueKey(),
                      textFieldValue: entry.repeats,
                      onEditingComplete: (String newValue) =>
                          {entry.repeats = newValue},
                    ),
                  ),
                  TableCell(
                    child: _EntryRemovalButton(() {
                      context.read<TableProvider>().removeEntry(entry);
                    }),
                  )
                ],
              )
          ],
        ),
        _AddEntryButton(
          () => {context.read<TableProvider>().addEntry(PlanEntry())},
        ),
      ],
    );
  }
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

/// Creates a Button that when clicked adds a [tableEntry] to the table.
class _AddEntryButton extends StatelessWidget {
  final void Function()? onPressed;

  const _AddEntryButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text(" + "));
  }
}
