import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.model.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_entry.model.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_list.model.dart';
import 'package:uuid/uuid.dart';

class TrainingPlanController extends GetxController {
  final RxString _selectedName = "".obs;
  final Rx<TrainingPlan> _selectedPlan = TrainingPlan({}).obs;
  final Rx<TrainingPlanList> _planList = TrainingPlanList({}).obs;

  final Uuid _uuid = const Uuid();

  void initTrainingPlanList(TrainingPlanList trainingPlanList) {
    planList = trainingPlanList;

    if (planList.trainingPlans.isEmpty) return;

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
    if (!planList.trainingPlans.containsKey(name)) return;

    selectedPlan = planList.trainingPlans[name]!;
  }

  void updatePlan(TrainingPlan plan) {
    planList.trainingPlans[selectedName] = plan;
    _selectedPlan.refresh();
  }

  void addEmptyPlanEntry() {
    final String uuid = _uuid.v1();

    selectedPlan.planEntries.putIfAbsent(
      uuid,
      () => TrainingPlanEntry("repeats", "exerciseName", "weight", "comment"),
    );

    updatePlan(selectedPlan);
  }

  void removeEntryForSelectedPlan(String id) {
    selectedPlan.planEntries.remove(id);
    updatePlan(selectedPlan);
  }

  void updateEntryForSelectedPlan(String key, TrainingPlanEntry entry) {
    if (!selectedPlan.planEntries.keys.contains(key)) return;

    selectedPlan.planEntries.update(key, (value) => value = entry);
    updatePlan(selectedPlan);
  }
}
