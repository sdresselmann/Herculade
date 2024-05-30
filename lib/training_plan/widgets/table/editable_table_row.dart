import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/training_plan/controllers/training_plan_controller.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_entry.dart';
import 'package:lifting_progress_tracker/training_plan/training_plan_service.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/table/editable_table_field.dart';

class EditableTableRow extends StatelessWidget {
  final TrainingPlanService _trainingPlanService = Get.find();

  final MapEntry<String, TrainingPlanEntry> entry;

  EditableTableRow({required this.entry});

  List<Widget> getTableRowChildren(
    BuildContext context,
    TrainingPlanController controller,
  ) {
    return [
      EditableTableField(
        key: UniqueKey(),
        initialValue: entry.value.exerciseName,
      ),
      EditableTableField(
        key: UniqueKey(),
        initialValue: entry.value.weight,
      ),
      EditableTableField(
        key: UniqueKey(),
        initialValue: entry.value.repeats,
      ),
      EditableTableField(
        key: UniqueKey(),
        initialValue: entry.value.comment,
      ),
      IconButton(
        onPressed: () {
          controller.removeEntry(entry.key);
          _trainingPlanService.update(controller.planList);
        },
        icon: const Icon(Icons.delete),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final TrainingPlanController controller = Get.find();

    return Row(
      children: getTableRowChildren(context, controller),
    );
  }
}
