import 'package:firebase_auth/firebase_auth.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_auth_service.dart';
import 'package:logging/logging.dart';

class AuthService {
  final Logger _logger;
  User? _user;

  AuthService() : _logger = Logger('AuthService');

  void authenticateUser() {
    final FirebaseAuthService authService = FirebaseAuthService();
    authService.signInTestUser().then(
          (User user) => {
            _user = user,
            _logger.log(
              Level.INFO,
              '${user.email} successfully authenticated.',
            ),
          },
        );
  }

  User? getAuthenticatedUser() {
    return _user;
  }

  String getAuthenticatedUserEmail() {
    return _user?.email ?? "user not authenticated";
  }

  String? getAuthenticatedUserUID() {
    return _user?.uid;
  }
}
