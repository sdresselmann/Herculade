import 'package:lifting_progress_tracker/core/models/app_user.model.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan.model.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_entry.model.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_list.model.dart';

class Given {
  AppUser getAppUser() {
    return AppUser("123", "test@user.de");
  }

  TrainingPlanEntry getTrainingPlanEntry() {
    return TrainingPlanEntry("ExerciseName", "weight", "repeats", "comment");
  }

  TrainingPlan getTrainingPlan() {
    return TrainingPlan(
      {
        "0": getTrainingPlanEntry(),
        "1": getTrainingPlanEntry(),
        "2": getTrainingPlanEntry(),
      },
    );
  }

  TrainingPlanList getTrainingPlanList() {
    return TrainingPlanList(
      {
        "0": getTrainingPlan(),
        "1": getTrainingPlan(),
      },
    );
  }
}
