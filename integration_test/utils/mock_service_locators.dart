import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/services/user_service.dart';

import 'mock_services/mock_user_service.dart';

void registerMockServiceLocators() {
  GetIt.I.registerLazySingleton<UserService>(() => MockUserService());
}
