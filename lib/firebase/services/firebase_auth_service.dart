import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: uri_does_not_exist
import 'package:lifting_progress_tracker/config/auth_config.dart';
import 'package:logging/logging.dart';

class FirebaseAuthService {
  final Logger log;
  FirebaseAuthService() : log = Logger('FirebaseAuthService');

  Future<void> signInTestUser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        // ignore: undefined_identifier
        email: AuthConfig.testUserEmail,

        // ignore: undefined_identifier
        password: AuthConfig.testUserPassword,
      );
      log.info("Signed in: ${userCredential.user!.email}");
    } catch (e) {
      log.severe("Error signing in: $e");
    }
  }
}
