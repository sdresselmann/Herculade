import 'package:lifting_progress_tracker/firebase/services/firestore_service.dart';
import 'package:lifting_progress_tracker/firebase/services/mocks/firestore_mock_data.dart';
import 'package:lifting_progress_tracker/firebase/types.dart';
import 'package:mockito/mockito.dart';

class FirestoreMockService extends Mock implements FirestoreService {
  final FirestoreMockData firestoreMockData = FirestoreMockData();

  @override
  Future<RawFirestoreData> getRawData(
    String documentReference,
    String documentId,
  ) async {
    return firestoreMockData.getAsync();
  }

  @override
  Future<void> uploadRawData(
    String collectionName,
    RawFirestoreData data,
  ) async {}
}
