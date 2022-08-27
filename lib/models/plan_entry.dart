class PlanEntry {
  /// Name of the Exercise entry.
  String exerciseName;

  /// Weight value plus the unit for the exercise entry:
  /// ```dart
  /// PlanEntry planEntry = PlanEntry();
  /// planEntry.weight = '20 kg';
  /// ```
  String weight;

  /// Number of repeats for the exercise entry exercise.
  ///
  /// The exact form of the repeats doesn't matter since its not really
  /// manipulated, but its recommended to use this format:
  /// ```dart
  /// PlanEntry planEntry = PlanEntry();
  /// planEntry.repeats = '3x15';
  /// ```
  /// Meaning 3 Sets of each 15 repeats.
  String repeats;

  /// A table entry as used inside of the [WorkoutTable] widget.
  PlanEntry([
    this.exerciseName = "exerciseName",
    this.weight = "weight",
    this.repeats = "repeats",
  ]);

  /// Transforms a JSON valid data object [mapData] into [PlanEntry].
  ///
  /// This comes in especially handy when reading data from firebase or other JSON tree data structures.
  ///
  /// ```dart
  /// final List<PlanEntry> entries = [];
  /// currentPlanEntries.forEach((key, value) {
  /// entries.add(PlanEntry.fromMap(value as Map<String, dynamic>));
  /// });
  /// ```
  PlanEntry.fromMap(final Map<String, dynamic> mapData)
      : exerciseName = mapData['exerciseName'].toString(),
        weight = mapData['weight'].toString(),
        repeats = mapData['repeats'].toString();

  /// Transforms the [PlanEntry] into a JSON valid data object for serialization or data storage.
  ///
  /// This comes in especially handy when storing data to firebase or other JSON tree data structures.
  /// This Function is best to be called by [getEntriesAsMap] to reduce repetitive code.
  Map<String, dynamic> _toMap() {
    return {
      'exerciseName': exerciseName,
      'weight': weight,
      'repeats': repeats,
    };
  }

  /// Turns the given [entries] into a Map that contains JSON valid data objects for serialization or data storage.
  ///
  /// This function makes use of [_toMap] to transform each object seperately.
  static Map<String, dynamic> getEntriesAsMap(final List<PlanEntry> entries) {
    final Map<String, dynamic> entryMap = {};

    for (int i = 0; i < entries.length; i++) {
      entryMap[i.toString()] = entries[i]._toMap();
    }
    return entryMap;
  }
}
