import 'package:firebase_core/firebase_core.dart';
import 'package:lifting_progress_tracker/firebase_options.dart';
import 'package:logging/logging.dart';

class FirebaseService {
  final Logger log;

  FirebaseService() : log = Logger('FirebaseService');

  Future<void> initializeFirebaseApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) => log.info("Firebase App initialized"));
  }
}
