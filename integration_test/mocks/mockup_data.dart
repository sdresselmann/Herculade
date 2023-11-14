import 'package:lifting_progress_tracker/types/types.dart';

RawFirestoreData getMockData() {
  final RawFirestoreData mockupData = {
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

  return mockupData;
}
