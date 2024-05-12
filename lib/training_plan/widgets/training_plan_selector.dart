import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/training_plan/controllers/selected_training_plan_controller.dart';

class TrainingPlanSelector extends StatelessWidget {
  final List<String> trainingPlanNames;

  const TrainingPlanSelector({required this.trainingPlanNames});

  @override
  Widget build(BuildContext context) {
    final TrainingPlanController controller = Get.find();

    return Obx(
      () {
        return DropdownButton<String>(
          value: controller.selectedName,
          items: _mapNamesToDropdownMenuItems(trainingPlanNames),
          onChanged: (String? value) {
            controller.selectedName = value!;
            controller.setPlanToCorrespondingName(value);
          },
        );
      },
    );
  }
}

List<DropdownMenuItem<String>> _mapNamesToDropdownMenuItems(
  List<String> list,
) {
  return list
      .map<DropdownMenuItem<String>>(
        (entry) => DropdownMenuItem(
          value: entry,
          child: Text(entry),
        ),
      )
      .toList();
}
