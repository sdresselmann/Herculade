import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lifting_progress_tracker/config/auth_config.dart';
import 'package:lifting_progress_tracker/core/models/app_user.dart';
import 'package:lifting_progress_tracker/firebase/firebase_options.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseService {
  final BehaviorSubject<bool> _isInitializationComplete$ = BehaviorSubject();

  final Logger _logger;
  late final FirebaseAuth _auth;

  FirebaseService() : _logger = Logger('FirebaseService');

  Future<void> initializeFirebaseApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) {
      _auth = FirebaseAuth.instance;
      _notifyListeners();
      _logger.info("Firebase App initialized");
    }).catchError((error) {
      _logger.severe("Firebase initialization failed", error);
    });
  }

  void _notifyListeners() {
    _isInitializationComplete$.add(true);
    _isInitializationComplete$.close();
  }

  AppUser getCurrentUser() {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw Exception("Current user not found on firebase.");
    }

    return AppUser.fromUser(currentUser);
  }

  Stream<bool> isInitializationComplete() {
    return _isInitializationComplete$.stream;
  }

  // Authenticate with test user for dev purposes!
  Future<void> signInTestUser() async {
    try {
      final UserCredential userCredential = await _signIn(
        AuthConfig.testUserEmail,
        AuthConfig.testUserPassword,
      );
      _logger.info("Signed in: ${userCredential.user!.email}");

      return Future.value();
    } catch (e) {
      _logger.severe("Error signing in: $e");
      throw Exception("User needs to be signed in!");
    }
  }

  Future<UserCredential> _signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
