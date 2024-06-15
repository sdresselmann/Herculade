import 'package:flutter_test/flutter_test.dart';
import 'package:lifting_progress_tracker/training_plan/controllers/training_plan.controller.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.model.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_list.model.dart';

import '../../../test_utils/given.dart';

void main() {
  group("Training Plan Controller Unit Tests.", () {
    final Given given = Given();
    final TrainingPlanController controller = TrainingPlanController();
    late TrainingPlanList trainingPlanList;

    setUp(
      () {
        trainingPlanList = given.getTrainingPlanList();
        controller.planList = TrainingPlanList({});
      },
    );

    test(
      "initTrainingPlanList() with valid trainingPlanList sets the training plan list.",
      () {
        controller.initTrainingPlanList(trainingPlanList);

        expect(controller.planList, trainingPlanList);
        expect(trainingPlanList.trainingPlans.isNotEmpty, true);
        expect(trainingPlanList.trainingPlans.entries.isNotEmpty, true);
      },
    );

    test(
        "initTrainingPlanList() with empty trainingPlanList sets the training plan list.",
        () {
      controller.initTrainingPlanList(TrainingPlanList({}));

      expect(controller.planList, isNotNull);
      expect(controller.planList.trainingPlans, isEmpty);
    });

    test(
        "initTrainingPlanList() with empty trainingPlanList does not change the selected training plan.",
        () {
      final previousSelectedPlan = controller.selectedPlan;
      final previousSelectedName = controller.selectedName;

      controller.initTrainingPlanList(TrainingPlanList({}));

      expect(controller.selectedPlan, isNotNull);
      expect(controller.selectedPlan, previousSelectedPlan);

      expect(controller.selectedName, previousSelectedName);
    });

    test(
      "initTrainingPlanList() with valid trainingPlanList sets the first training plan as selected training plan.",
      () {
        controller.initTrainingPlanList(trainingPlanList);

        expect(trainingPlanList.trainingPlans.isNotEmpty, true);
        expect(trainingPlanList.trainingPlans.entries.isNotEmpty, true);

        expect(
          trainingPlanList.trainingPlans.values.first,
          controller.selectedPlan,
        );
        expect(
          trainingPlanList.trainingPlans.keys.first,
          controller.selectedName,
        );
      },
    );

    test(
      "setPlanToCorrespondingName() with valid name sets the selected plan.",
      () {
        controller.initTrainingPlanList(trainingPlanList);
        controller.setPlanToCorrespondingName(
          trainingPlanList.trainingPlans.keys.last,
        );

        expect(
          trainingPlanList.trainingPlans.values.last,
          controller.selectedPlan,
        );
      },
    );

    test(
      "setPlanToCorrespondingName() with invalid name does not change the selected plan.",
      () {
        controller.initTrainingPlanList(trainingPlanList);
        controller.setPlanToCorrespondingName("invalid-name");

        expect(
          trainingPlanList.trainingPlans.values.first,
          controller.selectedPlan,
        );
      },
    );

    test(
      "updatePlans() with valid plan replaces the currently selected plan.",
      () {
        final TrainingPlan plan = given.getTrainingPlan();
        controller.initTrainingPlanList(trainingPlanList);
        final previousSelectedPlanName = controller.selectedName;

        controller.updatePlan(plan);

        expect(controller.selectedName, previousSelectedPlanName);

        expect(plan, controller.selectedPlan);
      },
    );

    test(
      "addEmptyPlanEntry() creates and adds a new entry to the training plan list.",
      () {
        final int lengthBefore = controller.planList.trainingPlans.length;

        controller.addEmptyPlanEntry();

        final int lengthAfter = controller.planList.trainingPlans.length;
        expect(lengthAfter, lengthBefore + 1);
      },
    );

    test(
      "removeEntryForSelectedPlan() with valid id removes the entry.",
      () {
        controller.initTrainingPlanList(trainingPlanList);

        final String id = controller.selectedPlan.planEntries.keys.first;

        controller.removeEntryForSelectedPlan(id);

        expect(
          controller.selectedPlan.planEntries.keys.contains(id),
          isFalse,
        );
      },
    );

    test(
      "removeEntryForSelectedPlan() with invalid id removes no entry.",
      () {
        controller.initTrainingPlanList(trainingPlanList);
        final int lengthBefore = controller.selectedPlan.planEntries.length;

        const String id = "Invalid id 1234657";

        controller.removeEntryForSelectedPlan(id);

        expect(
          controller.selectedPlan.planEntries.length,
          lengthBefore,
        );
      },
    );

    test(
      "updateEntryForSelectedPlan() with valid id updates the entry.",
      () {
        controller.initTrainingPlanList(trainingPlanList);
        final String id = controller.selectedPlan.planEntries.keys.first;

        final updatedEntry = given.getTrainingPlanEntry();
        updatedEntry.exerciseName = "updatedName";

        controller.updateEntryForSelectedPlan(id, updatedEntry);

        expect(controller.selectedPlan.planEntries[id], updatedEntry);
      },
    );

    test(
      "updateEntryForSelectedPlan() with valid id updates the entry.",
      () {
        controller.initTrainingPlanList(trainingPlanList);
        const String id = "Invalid id 1234657";
        final int lengthBefore = controller.selectedPlan.planEntries.length;

        final updatedEntry = given.getTrainingPlanEntry();
        updatedEntry.exerciseName = "updatedName";

        controller.updateEntryForSelectedPlan(id, updatedEntry);

        expect(controller.selectedPlan.planEntries.length, lengthBefore);
        expect(controller.selectedPlan.planEntries[id], null);
      },
    );
  });
}
