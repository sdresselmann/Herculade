import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:lifting_progress_tracker/core/utils/controller_registry.dart';
import 'package:lifting_progress_tracker/core/widgets/error_message.dart';
import 'package:lifting_progress_tracker/firebase/constants/collection_names.dart';
import 'package:lifting_progress_tracker/training_plan/controllers/selected_training_plan_controller.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_list.dart';
import 'package:lifting_progress_tracker/training_plan/training_plan_service.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/selected_training_plan.dart';
import 'package:lifting_progress_tracker/training_plan/widgets/training_plan_selector.dart';
import 'package:logging/logging.dart';

class TrainingPlanTable extends StatelessWidget {
  final TrainingPlanService _trainingPlanService =
      Get.put(TrainingPlanService());

  final UserService _userService = Get.find();

  final Logger _logger = Logger("_TrainingPlanTableState");

  @override
  Widget build(BuildContext context) {
    final controller =
        ControllerRegistry.registerController(TrainingPlanController());

    return Center(
      child: FutureBuilder(
        future: _trainingPlanService.get(
          CollectionNames.planEntries,
          _userService.user.uid,
        ),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            controller.initTrainingPlanList(snapshot.data!);

            return Column(
              children: [
                TrainingPlanSelector(
                  trainingPlanNames: _extractTrainingPlanNames(snapshot.data!),
                ),
                Obx(
                  () => SelectedTrainingPlan(
                    selectedPlan: controller.selectedPlan!,
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            _logger.warning(
              "The training plan list was not loaded properly: ${snapshot.error}",
            );
          }

          return ErrorMessage();
        },
      ),
    );
  }
}

List<String> _extractTrainingPlanNames(TrainingPlanList list) {
  return list.trainingPlans.keys.toList();
}
