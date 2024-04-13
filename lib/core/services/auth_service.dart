import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/interfaces/injectable.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_auth_service.dart';
import 'package:logging/logging.dart';

class AuthService implements Injectable {
  final Logger _logger;
  User? _user;

  AuthService() : _logger = Logger('AuthService') {
    _init();
  }

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

  void _init() {
    registerInjectable();
  }

  @override
  void registerInjectable() {
    GetIt.I.registerSingleton<AuthService>(this);
  }
}
