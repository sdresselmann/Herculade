import 'package:firebase_auth/firebase_auth.dart';
import 'package:lifting_progress_tracker/config/auth_config.dart';
import 'package:logger/logger.dart';

class AuthService {
  final Logger _logger;

  AuthService() : _logger = Logger();

  Future<void> signInTestUser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: AuthConfig.testUserEmail,
        password: AuthConfig.testUserPassword,
      );
      _logger.d("Signed in: ${userCredential.user!.email}");
    } catch (e) {
      _logger.e("Error signing in: $e");
    }
  }
}
