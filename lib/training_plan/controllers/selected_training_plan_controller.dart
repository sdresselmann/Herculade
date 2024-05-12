import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_list.dart';

class TrainingPlanController extends GetxController {
  final RxString _selectedName = "".obs;
  final Rx<TrainingPlan?> _selectedPlan = Rx<TrainingPlan?>(null);
  final Rx<TrainingPlanList> planList = TrainingPlanList({}).obs;

  void initTrainingPlanList(TrainingPlanList trainingPlanList) {
    planList.value = trainingPlanList;

    selectedName = planList.value.trainingPlans.keys.first;
    selectedPlan = planList.value.trainingPlans.entries.first.value;
  }

  String get selectedName {
    return _selectedName.value;
  }

  set selectedName(String name) {
    _selectedName.value = name;
  }

  TrainingPlan? get selectedPlan {
    return _selectedPlan.value;
  }

  set selectedPlan(TrainingPlan? plan) {
    _selectedPlan.value = plan;
  }

  void setPlanToCorrespondingName(String name) {
    selectedPlan = planList.value.trainingPlans[name];
  }
}
