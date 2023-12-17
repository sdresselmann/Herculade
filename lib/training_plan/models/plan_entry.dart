class PlanEntry {
  String exerciseName;
  String weight;
  String repeats;

  PlanEntry({
    this.exerciseName = "exerciseName",
    this.weight = "weight",
    this.repeats = "repeats",
  });

  /// Transforms a JSON valid data object  into a [PlanEntry].
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
  Map<String, dynamic> toMap() {
    return {
      'exerciseName': exerciseName,
      'weight': weight,
      'repeats': repeats,
    };
  }

  /// Turns the given [entries] into a Map that contains JSON valid data objects for serialization or data storage.
  ///
  /// This function makes use of [toMap] to transform each object seperately.
  static Map<String, dynamic> getEntriesAsMap(final List<PlanEntry> entries) {
    final Map<String, dynamic> entryMap = {};

    for (int i = 0; i < entries.length; i++) {
      entryMap[i.toString()] = entries[i].toMap();
    }
    return entryMap;
  }
}
