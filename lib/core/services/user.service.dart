import 'dart:async';

import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/models/app_user.model.dart';
import 'package:lifting_progress_tracker/firebase/constants/collection_names.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/default_training_plan.data.dart';
import 'package:logging/logging.dart';

class UserService extends GetxService {
  final Logger _logger = Logger("UserService");

  final FirebaseService _firebaseService = Get.find();
  final FirestoreService _firestoreService = Get.find();

  late final AppUser _user;
  late final Future<AppUser> user$;
  final Completer<AppUser> _userCompleter = Completer();

  set user(AppUser newUser) {
    _user = newUser;
    _userCompleter.complete(_user);

    _logger.info(
      "Current user is set to user ${_user.email} with ${_user.uid}.",
    );
  }

  AppUser get user {
    return _user;
  }

  UserService() {
    user$ = _userCompleter.future;
  }

  Future<void> initializeUser() async {
    await _firebaseService.signInTestUser();

    final currentUser = _getAppUser();
    user = currentUser;
  }

  AppUser _getAppUser() {
    final currentUser = _firebaseService.getCurrentUser();
    final String email = currentUser.email;

    return AppUser(currentUser.uid, email);
  }

  Future<void> initUserCollections() {
    return _createTrainingPlansForUser();
  }

  Future<void> _createTrainingPlansForUser() async {
    final bool hasUserPlanEntries = await _firestoreService.exists(
      CollectionNames.planEntries,
      user.uid,
    );

    if (hasUserPlanEntries) return;

    await _firestoreService.set(
      CollectionNames.planEntries,
      user.uid,
      defaultTrainingPlan,
    );

    _logger.info(
      "Created plan entries with id ${user.uid} for the user ${user.email}.",
    );
  }
}
