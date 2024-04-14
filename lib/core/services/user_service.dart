import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/core/services/auth_service.dart';
import 'package:logging/logging.dart';

class UserService {
  final Logger _logger;
  final AuthService authService = GetIt.I.get<AuthService>();

  UserService() : _logger = Logger("UserService");

  void initializeCurrentUser() {
    _logger.log(Level.INFO, "");
  }

/** if (is User authenticated)
 *      if(user document mapping NOT exists)
 *          create document
 *      get document key
 *      store document key
 **/
}
