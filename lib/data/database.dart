import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';

class Database {
  /// Firebase API Key
  static const apiKey = 'AIzaSyAAvQNgL2DNb7dT-7UjsJoeV8u8LJWcVhc';

  /// Firebase project ID
  static const projectId = 'lifting-progress-tracker';

  static Firestore firestore = Firestore.instance;

  factory Database() {
    return _instance;
  }

  static void initialize() {
    try {
      Firestore.initialize(projectId);
    } catch (firestoreException) {
      debugPrint(firestoreException.toString());
    }
  }

  Database._privateConstructor();

  static final Database _instance = Database._privateConstructor();
}
