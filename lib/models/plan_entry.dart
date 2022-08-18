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
}
