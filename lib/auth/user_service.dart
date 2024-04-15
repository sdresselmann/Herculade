import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:logging/logging.dart';

class UserService {
  final Logger _logger;

  final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();
  late final User user;

  UserService() : _logger = Logger("UserService");

  void initializeUser() {
    _firebaseService.isInitializationComplete().listen((isInitialized) {
      if (!isInitialized) return;
      _firebaseService.signInTestUser().then((User user) => this.user = user);
    });

    /** if (is User authenticated)
     *      if(user document mapping NOT exists)
     *          create document
     *      get document key
     *      store document key
     **/
    _logger.log(Level.INFO, "Getting User Info...");
  }
}
