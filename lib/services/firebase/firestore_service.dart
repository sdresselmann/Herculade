import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lifting_progress_tracker/types/types.dart';
import 'package:logging/logging.dart';

class FirestoreService {
  final Logger log;
  final FirebaseFirestore firestore;

  FirestoreService(this.firestore) : log = Logger('FirestoreService');

  Future<RawFirestoreData> getRawData(String collectionName) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection(collectionName).get();

    final RawFirestoreData data = querySnapshot.docs.first.data();

    return data;
  }

  Future<void> uploadRawData(
    String collectionName,
    RawFirestoreData data,
  ) async {
    firestore
        .collection(collectionName)
        .add(data)
        .then((value) => log.info("raw data uploaded"))
        .catchError((error) => log.severe("Failed to add raw data: $error"));
  }
}
