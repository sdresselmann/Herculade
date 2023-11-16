import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/firebase_options.dart';
import 'package:lifting_progress_tracker/services/firestore_service.dart';
import 'package:logging/logging.dart';

class FirebaseService {
  final Logger log;

  FirebaseService() : log = Logger('FirebaseService');

  Future<void> initializeFirebaseApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) {
      setupFirestore();
      log.info("Firebase App initialized");
    });
  }

  void setupFirestore() {
    GetIt.instance.registerSingleton<FirestoreService>(
      FirestoreService(FirebaseFirestore.instance),
    );
  }
}
