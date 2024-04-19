import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:lifting_progress_tracker/firebase/types.dart';
import 'package:logging/logging.dart';

class FirestoreService {
  final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();

  late final FirebaseFirestore _firestore;

  final Logger _log = Logger('FirestoreService');

  FirestoreService() {
    initialize();
  }

  void initialize() {
    _firebaseService
        .isInitializationComplete()
        .listen((event) => _firestore = FirebaseFirestore.instance);
  }

  Future<bool> documentExists(String collectionName, String documentId) {
    return _firestore
        .collection(collectionName)
        .doc(documentId)
        .get()
        .then((docSnapshot) => docSnapshot.exists);
  }

  Future<void> createDocument(
    String collectionName,
    String documentId,
    Map<String, dynamic> documentData,
  ) {
    return _firestore
        .collection(collectionName)
        .doc(documentId)
        .set(documentData);
  }

  Future<RawFirestoreData?> getRawData(
    String collectionName,
    String documentId,
  ) async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _firestore.collection(collectionName).doc(documentId).get();

    if (!documentSnapshot.exists) throw Exception("Document does not exist");

    return documentSnapshot.data();
  }

  Future<void> uploadRawData(
    String collectionName,
    RawFirestoreData data,
  ) async {
    _firestore
        .collection(collectionName)
        .add(data)
        .then((value) => _log.info("raw data uploaded"))
        .catchError((error) => _log.severe("Failed to add raw data: $error"));
  }
}
