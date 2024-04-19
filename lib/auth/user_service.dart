import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/training_plan/default_training_plan_data.dart';
import 'package:logging/logging.dart';

class UserService {
  final Logger _logger;

  final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();
  final FirestoreService _firestoreService = GetIt.I.get<FirestoreService>();

  late final User user;

  UserService() : _logger = Logger("UserService");

  void initializeUser() {
    _firebaseService.isInitializationComplete().listen((isInitialized) async {
      if (!isInitialized) return;

      user = await _firebaseService.signInTestUser();
      _logger.log(
        Level.INFO,
        "Current user is set to user ${user.email} with ${user.uid}.",
      );

      _initUserCollections();
    });
  }

  void _initUserCollections() {
    _createTrainingPlanForUser();
  }

  Future<void> _createTrainingPlanForUser() async {
    final bool hasUserPlanEntries =
        await _firestoreService.documentExists("plan-entries", user.uid);

    if (hasUserPlanEntries) return;

    _logger.log(
      Level.INFO,
      "The current user has no plan entries. Creating plan entries for user.",
    );

    await _firestoreService.createDocument(
      "plan-entries",
      user.uid,
      defaultTrainingPlan,
    );

    _logger.log(
      Level.INFO,
      "Plan entries with id ${user.uid} for user ${user.email} created.",
    );
  }
}
