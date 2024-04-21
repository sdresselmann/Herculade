import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/models/app_User.dart';
import 'package:lifting_progress_tracker/firebase/constants/collection_names.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/default_training_plan_data.dart';
import 'package:logging/logging.dart';

class UserService {
  final Logger _logger = Logger("UserService");

  final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();
  final FirestoreService _firestoreService = GetIt.I.get<FirestoreService>();

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

  void initUserCollections() {
    _createTrainingPlansForUser();
  }

  Future<void> _createTrainingPlansForUser() async {
    final bool hasUserPlanEntries = await _firestoreService.documentExists(
      CollectionNames.planEntries,
      user.uid,
    );

    if (hasUserPlanEntries) return;

    await _firestoreService.createDocument(
      CollectionNames.planEntries,
      user.uid,
      defaultTrainingPlan,
    );

    _logger.info(
      "Created plan entries with id ${user.uid} for the user ${user.email}.",
    );
  }
}
