import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_entry.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_list.dart';
import 'package:uuid/uuid.dart';

class TrainingPlanController extends GetxController {
  final RxString _selectedName = "".obs;
  final Rx<TrainingPlan> _selectedPlan = TrainingPlan({}).obs;
  final Rx<TrainingPlanList> _planList = TrainingPlanList({}).obs;

  final Uuid _uuid = const Uuid();

  void initTrainingPlanList(TrainingPlanList trainingPlanList) {
    planList = trainingPlanList;

    selectedName = planList.trainingPlans.keys.first;
    selectedPlan = planList.trainingPlans.entries.first.value;
  }

  String get selectedName {
    return _selectedName.value;
  }

  set selectedName(String name) {
    _selectedName.value = name;
  }

  TrainingPlan get selectedPlan {
    return _selectedPlan.value;
  }

  set selectedPlan(TrainingPlan plan) {
    _selectedPlan.value = plan;
  }

  TrainingPlanList get planList {
    return _planList.value;
  }

  set planList(TrainingPlanList planList) {
    _planList.value = planList;
  }

  void setPlanToCorrespondingName(String name) {
    selectedPlan = planList.trainingPlans[name]!;
  }

  void updatePlans(TrainingPlan plan) {
    planList.trainingPlans[selectedName] = plan;
    _selectedPlan.refresh();
  }

  void addEmptyPlanEntry() {
    final String uuid = _uuid.v1();

    selectedPlan.planEntries.putIfAbsent(
      uuid,
      () => TrainingPlanEntry("repeats", "exerciseName", "weight", "comment"),
    );

    updatePlans(selectedPlan);
  }

  void removeEntry(String id) {
    selectedPlan.planEntries.remove(id);
    updatePlans(selectedPlan);
  }

  void updateEntry(String key, TrainingPlanEntry entry) {
    selectedPlan.planEntries.update(key, (value) => value = entry);
    updatePlans(selectedPlan);
  }
}
