import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/firebase/types.dart';
import 'package:mocktail/mocktail.dart';

import 'firestore_mock_data.dart';

class MockFirestoreService extends Mock implements FirestoreService {
  final MockFirestoreData mockFirestoreData = MockFirestoreData();

  @override
  Future<RawFirestoreData> getRawData(
    String documentReference,
    String documentId,
  ) async {
    return mockFirestoreData.getAsync();
  }

  @override
  Future<void> uploadRawData(
    String collectionName,
    RawFirestoreData data,
  ) async {}
}
