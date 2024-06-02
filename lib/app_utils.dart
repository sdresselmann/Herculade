import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/logging.dart';
import 'package:lifting_progress_tracker/core/service_locators.dart';
import 'package:lifting_progress_tracker/core/services/user.service.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';

void setupAppUtils() {
  registerLazySingletons();

  setupLogging();
  setup();
}

Future<void> setup() async {
  final FirebaseService firebaseService = Get.find();
  await firebaseService.initializeFirebaseApp();

  setupCurrentUser();
}

Future<void> setupCurrentUser() async {
  final UserService userService = Get.find();
  await userService.initializeUser();
  userService.initUserCollections();
}
