import 'package:get/get.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseService extends GetxService
    with Mock
    implements FirebaseService {}
