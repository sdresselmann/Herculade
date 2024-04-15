import 'package:logging/logging.dart';

class UserService {
  final Logger _logger;

  // final AuthService _authService = GetIt.I.get<AuthService>();
  // final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();

  UserService() : _logger = Logger("UserService");

  void initializeCurrentUser() {
    // if (!_firebaseService.isInitialized) return;

    _logger.log(Level.INFO, "Getting User Info...");
  }

/** if (is User authenticated)
 *      if(user document mapping NOT exists)
 *          create document
 *      get document key
 *      store document key
 **/
}
