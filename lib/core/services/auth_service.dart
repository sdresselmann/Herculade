import 'package:lifting_progress_tracker/firebase/services/firebase_auth_service.dart';
import 'package:logging/logging.dart';

class AuthService {
  final Logger log;

  AuthService() : log = Logger('AuthService');

  void authenticateUser() {
    final FirebaseAuthService authService = FirebaseAuthService();
    authService.signInTestUser();
  }
}
