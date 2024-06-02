import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/widgets/delete_dialog.dart';
import 'package:lifting_progress_tracker/training_plan/controllers/training_plan.controller.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_entry.model.dart';
import 'package:lifting_progress_tracker/training_plan/training_plan.service.dart';
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
        onChanged: updateExerciseName,
      ),
      EditableTableField(
        key: UniqueKey(),
        initialValue: entry.value.weight,
        onChanged: updateWeight,
      ),
      EditableTableField(
        key: UniqueKey(),
        initialValue: entry.value.repeats,
        onChanged: updateRepeats,
      ),
      EditableTableField(
        key: UniqueKey(),
        initialValue: entry.value.comment,
        onChanged: updateComment,
      ),
      IconButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => DeleteDialog(
            subject: "row",
            onConfirm: () => _removeRow(controller, context),
          ),
        ),
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

  void updateExerciseName(String value) {
    entry.value.exerciseName = value;
    _updateRowEntries();
  }

  void updateWeight(String value) {
    entry.value.weight = value;
    _updateRowEntries();
  }

  void updateRepeats(String value) {
    entry.value.repeats = value;
    _updateRowEntries();
  }

  void updateComment(String value) {
    entry.value.comment = value;
    _updateRowEntries();
  }

  void _updateRowEntries() {
    final TrainingPlanController controller = Get.find();
    controller.updateEntry(entry.key, entry.value);

    _trainingPlanService.update(controller.planList);
  }

  void _removeRow(TrainingPlanController controller, BuildContext context) {
    controller.removeEntry(entry.key);
    _trainingPlanService.update(controller.planList);
  }
}
