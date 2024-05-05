import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/training_plan_service.dart';

void registerLazySingletons() {
  GetIt.I.registerLazySingleton<FirebaseService>(() => FirebaseService());
  GetIt.I.registerLazySingleton<FirestoreService>(() => FirestoreService());

  GetIt.I.registerLazySingleton(() => UserService());

  GetIt.I
      .registerLazySingleton<TrainingPlanService>(() => TrainingPlanService());
}
