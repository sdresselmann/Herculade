import 'package:firebase_auth/firebase_auth.dart';
import 'package:lifting_progress_tracker/config/auth_config.dart';
import 'package:logging/logging.dart';

class AuthService {
  final Logger log;
  AuthService() : log = Logger('AuthService');

  Future<void> signInTestUser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: AuthConfig.testUserEmail,
        password: AuthConfig.testUserPassword,
      );
      log.info("Signed in: ${userCredential.user!.email}");
    } catch (e) {
      log.severe("Error signing in: $e");
    }
  }
}
