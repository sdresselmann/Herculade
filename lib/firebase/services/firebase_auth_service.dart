import 'package:firebase_auth/firebase_auth.dart';
import 'package:lifting_progress_tracker/config/auth_config.dart';
import 'package:logging/logging.dart';

class FirebaseAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final Logger log;

  FirebaseAuthService() : log = Logger('FirebaseAuthService');

  Future<User> signInTestUser() async {
    try {
      final UserCredential userCredential = await _signIn(
        AuthConfig.testUserEmail,
        AuthConfig.testUserPassword,
      );
      log.info("Signed in: ${userCredential.user!.email}");

      return Future.value(userCredential.user);
    } catch (e) {
      log.severe("Error signing in: $e");
      throw Exception();
    }
  }

  Future<UserCredential> _signIn(String email, String password) {
    return auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  bool isAuthenticated() {
    return auth.currentUser != null;
  }

  Stream<User?> authStateChanges() {
    return auth.authStateChanges();
  }
}
