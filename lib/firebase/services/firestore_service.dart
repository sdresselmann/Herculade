import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/firebase/services/firebase_service.dart';
import 'package:logging/logging.dart';

class FirestoreService {
  final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();

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
    _logger.info(
      "Created a new document with  id $documentId for collection $collectionName",
    );
    return _firestore
        .collection(collectionName)
        .doc(documentId)
        .set(documentData);
  }

  // Future<Map<String, dynamic>?> getRawData(
  //   String collectionName,
  //   String documentId,
  // ) async {
  //   final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
  //       await _firestore.collection(collectionName).doc(documentId).get();
  //
  //   if (!documentSnapshot.exists) {
  //     _logger.severe(
  //       "Document with id $documentId does not exist.",
  //     );
  //     return null;
  //   }
  //
  //   return documentSnapshot.data();
  // }

  Future<Map<String, dynamic>?> get(
    String collectionName,
    String documentId,
  ) async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _firestore.collection(collectionName).doc(documentId).get();

    if (!documentSnapshot.exists) {
      _logger.severe(
        "Document with id $documentId does not exist.",
      );
      return null;
    }

    return documentSnapshot.data();
  }

// Future<void> uploadRawData(
//   String collectionName,
//   Map<String, dynamic> data,
// ) async {
//   _firestore
//       .collection(collectionName)
//       .add(data)
//       .then(
//         (value) =>
//             _logger.info("Data for collection $collectionName was added."),
//       )
//       .catchError(
//         (error) => _logger.severe(
//           "Failed to add data to collection $collectionName: $error",
//         ),
//       );
// }
}
