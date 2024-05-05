import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/training_plan/controllers/selected_training_plan_controller.dart';

class TrainingPlanSelector extends StatefulWidget {
  final List<String> trainingPlanNames;

  const TrainingPlanSelector({required this.trainingPlanNames});

  @override
  State<StatefulWidget> createState() => _TrainingPlanSelectorState();
}

class _TrainingPlanSelectorState extends State<TrainingPlanSelector> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectedTrainingPlanController());

    return Obx(
      () {
        return DropdownButton<String>(
          value: controller.selectedName,
          items: _mapNamesToDropdownMenuItems(widget.trainingPlanNames),
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
