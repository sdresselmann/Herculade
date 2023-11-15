import 'package:firebase_core/firebase_core.dart';
import 'package:lifting_progress_tracker/firebase_options.dart';
import 'package:lifting_progress_tracker/services/auth_service.dart';
import 'package:logger/logger.dart';

class FirebaseService {
  final Logger _logger;

  FirebaseService() : _logger = Logger();

  Future<void> initializeFirebaseApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) => _logger.d("Firebase App initialized"));

    // for now just use a test user
    authenticateUser();
  }

  void authenticateUser() {
    final AuthService authService = AuthService();
    authService.signInTestUser();
  }
}
