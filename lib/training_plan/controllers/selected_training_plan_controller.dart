import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_list.dart';

class SelectedTrainingPlanController {
  final RxString _selectedName = "".obs;
  final Rx<TrainingPlan?> _selectedPlan = Rx<TrainingPlan?>(null);

  late final TrainingPlanList _list;

  void initTrainingPlanList(TrainingPlanList trainingPlanList) {
    _list = trainingPlanList;

    selectedName = _list.trainingPlans.keys.first;
    selectedPlan = _list.trainingPlans.entries.first.value;
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
    selectedPlan = _list.trainingPlans[name];
  }
}
