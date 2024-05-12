import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/firebase/firestore_json.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:logging/logging.dart';

class FirestoreService extends GetxService {
  final FirebaseService _firebaseService = Get.find();

  late final FirebaseFirestore _firestore;

  final Logger _logger = Logger('FirestoreService');

  FirestoreService() {
    _initialize();
  }

  void _initialize() {
    _firebaseService
        .isInitializationComplete()
        .listen((event) => _firestore = FirebaseFirestore.instance);
  }

  Future<bool> exists(String collectionName, String documentId) {
    return _firestore
        .collection(collectionName)
        .doc(documentId)
        .get()
        .then((docSnapshot) => docSnapshot.exists);
  }

  Future<void> set(
    String collectionName,
    String documentId,
    Map<String, dynamic> documentData,
  ) {
    return _firestore
        .collection(collectionName)
        .doc(documentId)
        .set(documentData);
  }

  Future<FirestoreJson> get(
    String collectionName,
    String documentId,
  ) async {
    final DocumentSnapshot<FirestoreJson> documentSnapshot =
        await _firestore.collection(collectionName).doc(documentId).get();

    if (!documentSnapshot.exists) {
      _logger.severe(
        "Document with id $documentId does not exist.",
      );
      return throw Exception();
    }

    return documentSnapshot.data()!;
  }
}
