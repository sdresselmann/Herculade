import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';
import 'package:lifting_progress_tracker/models/plan_entry.dart';
import 'package:lifting_progress_tracker/providers/table_provider.dart';
import 'package:lifting_progress_tracker/widgets/table/add_entry_button.dart';
import 'package:lifting_progress_tracker/widgets/table/entry_removal_button.dart';
import 'package:lifting_progress_tracker/widgets/table/table_text_field.dart';
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
/// The table data is filled up with [TableProvider._tableEntries] that can be manipulated later by
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
                      onEditingComplete: (String updatedName) => {
                        context.read<TableProvider>().updateEntry(
                              oldPlanEntry: entry,
                              updatedPlanEntry: PlanEntry(
                                exerciseName: updatedName,
                                weight: entry.weight,
                                repeats: entry.repeats,
                              ),
                            ),
                      },
                    ),
                  ),
                  TableCell(
                    child: TableTextField(
                      key: UniqueKey(),
                      textFieldValue: entry.weight,
                      onEditingComplete: (String updatedWeight) => {
                        context.read<TableProvider>().updateEntry(
                              oldPlanEntry: entry,
                              updatedPlanEntry: PlanEntry(
                                exerciseName: entry.exerciseName,
                                weight: updatedWeight,
                                repeats: entry.repeats,
                              ),
                            ),
                      },
                    ),
                  ),
                  TableCell(
                    child: TableTextField(
                      key: UniqueKey(),
                      textFieldValue: entry.repeats,
                      onEditingComplete: (String updatedRepeats) => {
                        context.read<TableProvider>().updateEntry(
                              oldPlanEntry: entry,
                              updatedPlanEntry: PlanEntry(
                                exerciseName: entry.exerciseName,
                                weight: entry.weight,
                                repeats: updatedRepeats,
                              ),
                            ),
                      },
                    ),
                  ),
                  TableCell(
                    child: EntryRemovalButton(() {
                      context.read<TableProvider>().removeEntry(entry);
                    }),
                  )
                ],
              )
          ],
        ),
        AddEntryButton(
          () => {context.read<TableProvider>().addEntry(PlanEntry())},
        ),
      ],
    );
  }
}
