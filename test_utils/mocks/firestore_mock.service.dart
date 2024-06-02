import 'package:get/get.dart';
import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:mocktail/mocktail.dart';

import 'firestore_mock.data.dart';

class MockFirestoreService extends GetxService
    with Mock
    implements FirestoreService {
  final MockFirestoreData mockFirestoreData = MockFirestoreData();
}
