import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/services/auth_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/services/training_plan_service.dart';

void registerLazySingletons() {
  GetIt.I.registerLazySingleton<FirestoreService>(() => FirestoreService());
  GetIt.I.registerLazySingleton<AuthService>(() => AuthService());

  GetIt.I
      .registerLazySingleton<TrainingPlanService>(() => TrainingPlanService());
}
