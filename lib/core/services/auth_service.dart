import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:logging/logging.dart';

class AuthService {
  final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();

  final Logger _logger;
  User? _user;

  AuthService() : _logger = Logger('AuthService');

  void authenticateUser() {
    _firebaseService
        .signInTestUser()
        .then(
          (User user) => {
            _user = user,
            _logger.log(
              Level.INFO,
              '${user.email} successfully authenticated.',
            ),
          },
        )
        .catchError(
          (error) => {_logger.severe("Authentication failed", error)},
        );
  }

  String getAuthenticatedUserEmail() {
    return _user?.email ?? "user not authenticated";
  }
}
