import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/core/constants/timer.dart';
import 'package:lifting_progress_tracker/training_plan/controllers/selected_training_plan_controller.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.dart';
import 'package:lifting_progress_tracker/training_plan/training_plan_service.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table_header.dart';

class SelectedTrainingPlan extends StatelessWidget {
  final TrainingPlanService _trainingPlanService = Get.find();

  final TrainingPlan selectedPlan;

  SelectedTrainingPlan({required this.selectedPlan});

  final Rx<String> _userInput = "".obs;

  @override
  Widget build(BuildContext context) {
    final TrainingPlanController controller = Get.find();

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
                children: [
                  // Text(entry.value.exerciseName),
                  TextFormField(
                    initialValue: entry.value.exerciseName,
                    onChanged: (String exerciseName) {
                      _setDebounce(_userInput, (input) => {});
                      _userInput.value = exerciseName;
                    },
                  ),
                  Text(entry.value.weight),
                  Text(entry.value.repeats),
                  Text(entry.value.comment),
                  IconButton(
                    onPressed: () {
                      controller.removeEntry(entry.key);
                      _trainingPlanService.update(controller.planList);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }

  void _setDebounce(Rx<String> observable, Function(String input) callback) {
    debounce(
      observable,
      (String input) {
        callback(input);
      },
      time: const Duration(milliseconds: textFieldDebounceTime),
    );
  }
}
