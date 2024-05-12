import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:lifting_progress_tracker/firebase/constants/collection_names.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/models/training_plan_list.dart';

class TrainingPlanService {
  final FirestoreService _firestoreService = Get.find();
  final UserService _userService = Get.find();

  Future<TrainingPlanList> get() async {
    return TrainingPlanList.fromJson(
      await _firestoreService.get(
        CollectionNames.planEntries,
        _userService.user.uid,
      ),
    );
  }

  void update(
    TrainingPlanList planList,
  ) {
    _firestoreService.set(
      CollectionNames.planEntries,
      _userService.user.uid,
      planList.toJson(),
    );
  }
}
