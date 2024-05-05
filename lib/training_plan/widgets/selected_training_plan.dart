import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/training_plan/controllers/selected_training_plan_controller.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table_header.dart';

class SelectedTrainingPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SelectedTrainingPlanController controller = Get.find();

    return Obx(() {
      final selectedTrainingPlan = controller.selectedPlan;
      if (selectedTrainingPlan == null) {
        // Handle the case where selectedTrainingPlan is null, such as displaying a loading indicator or a message
        return const CircularProgressIndicator();
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
              for (final entry in selectedTrainingPlan.planEntries.entries)
                TableRow(
                  children: [
                    Text(entry.value.exerciseName),
                    Text(entry.value.weight),
                    Text(entry.value.repeats),
                    Text(entry.value.comment),
                    const IconButton(
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
    });
  }
}
