import 'package:lifting_progress_tracker/firebase/types.dart';

class FirestoreMockData {
  RawFirestoreData data = {};

  void setDefaultMockData() {
    final RawFirestoreData defaultMockData = {
      'trainingplan1': {
        '0': {
          'exerciseName': 'Deadlift',
          'weight': '20kg',
          'repeats': '5x6',
        },
        '1': {
          'exerciseName': 'Benchpress',
          'weight': '12.5kg',
          'repeats': '5x10',
        },
        '2': {
          'exerciseName': 'Squats',
          'weight': '10kg',
          'repeats': '3x15',
        },
      },
      'trainingplan2': {},
    };

    data = defaultMockData;
  }

  void setEmptyMockData() {
    final RawFirestoreData mockData = {};
    data = mockData;
  }

  Future<RawFirestoreData> getAsync() {
    return Future.value(data);
  }
}
