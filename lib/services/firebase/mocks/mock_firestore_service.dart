import 'package:lifting_progress_tracker/services/firebase/firestore_service.dart';
import 'package:lifting_progress_tracker/services/firebase/mocks/firestore_mock_data.dart';
import 'package:lifting_progress_tracker/types/types.dart';
import 'package:mockito/mockito.dart';

class MockFirestoreService extends Mock implements FirestoreService {
  final FirestoreMockData firestoreMockData = FirestoreMockData();

  @override
  Future<RawFirestoreData> getRawData(String documentReference) async {
    return firestoreMockData.getAsync();
  }

  @override
  Future<void> uploadRawData(
    String collectionName,
    RawFirestoreData data,
  ) async {}
}
