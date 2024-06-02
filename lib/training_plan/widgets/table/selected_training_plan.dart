import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.model.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table/editable_table_row.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table/table_header.dart';

class SelectedTrainingPlan extends StatelessWidget {
  final TrainingPlan selectedPlan;

  const SelectedTrainingPlan({required this.selectedPlan});

  @override
  Widget build(BuildContext context) {
    if (selectedPlan.planEntries.isEmpty) {
      return const Text(emptyTrainingPlanPlaceholder);
    }

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
            for (final entry in selectedPlan.planEntries.entries)
              TableRow(
                children: EditableTableRow(entry: entry)
                    .getTableRowChildren(context, Get.find()),
              ),
          ],
        ),
      ],
    );
  }
}
