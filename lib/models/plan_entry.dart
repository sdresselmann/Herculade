class PlanEntry {
  String exerciseName;
  String weight;
  String repeats;

  /// Table entries used inside of the [WorkoutTable] widget.
  PlanEntry({
    this.exerciseName = "exerciseName",
    this.weight = "weight",
    this.repeats = "repeats",
  });

  PlanEntry.fromMap(Map<String, dynamic> mapData)
      : exerciseName = mapData['exerciseName'].toString(),
        weight = mapData['weight'].toString(),
        repeats = mapData['repeats'].toString();

  Map<String, dynamic> toMap() {
    return {
      'exerciseName': exerciseName,
      'weight': weight,
      'repeats': repeats,
    };
  }

  static Map<String, dynamic> getEntriesAsMap(List<PlanEntry> entries) {
    final Map<String, dynamic> entryMap = {};

    for (int i = 0; i <= entries.length; i++) {
      entryMap[i.toString()] = entries[i].toMap();
    }
    print(entryMap);
    return entryMap;
  }
}
