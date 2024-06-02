class MockFirestoreData {
  Map<String, dynamic> data = {};

  void setDefaultMockData() {
    final Map<String, dynamic> defaultMockData = {
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
    final Map<String, dynamic> mockData = {};
    data = mockData;
  }

  Future<Map<String, dynamic>> getAsync() {
    return Future.value(data);
  }
}
