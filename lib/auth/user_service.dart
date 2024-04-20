import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/firebase/collection_names.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/default_training_plan_data.dart';
import 'package:logging/logging.dart';

class UserService {
  final Logger _logger = Logger("UserService");

  final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();
  final FirestoreService _firestoreService = GetIt.I.get<FirestoreService>();

  late final User _user;
  late final Future<User> userFuture;
  final Completer<User> _userCompleter = Completer();

  set user(User newUser) {
    _user = newUser;
    _userCompleter.complete(user);
  }

  User get user {
    return _user;
  }

  UserService() {
    userFuture = _userCompleter.future;
  }

  Future<void> initializeUser() async {
    await _firebaseService.signInTestUser();

    final currentUser = _firebaseService.getCurrentUser();

    if (currentUser == null) {
      _logger.info(
        "Current user can not be set.",
      );
      return;
    }

    user = currentUser;
    _logger.info(
      "Current user is set to user ${user.email} with ${user.uid}.",
    );

    _initUserCollections();
  }

  void _initUserCollections() {
    _createTrainingPlanForUser();
  }

  Future<void> _createTrainingPlanForUser() async {
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
      "Plan entries with id ${user.uid} for user ${user.email} created.",
    );
  }
}
