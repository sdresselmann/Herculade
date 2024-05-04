import 'package:flutter/material.dart';

class TrainingPlanSelector extends StatefulWidget {
  final List<String> trainingPlanNames;

  const TrainingPlanSelector({required this.trainingPlanNames});

  @override
  State<StatefulWidget> createState() => _TrainingPlanSelectorState();
}

class _TrainingPlanSelectorState extends State<TrainingPlanSelector> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.trainingPlanNames.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      items: _mapNamesToDropdownMenuItems(widget.trainingPlanNames),
      onChanged: (String? value) => _updateDropdownValue(value!),
    );
  }

  void _updateDropdownValue(String value) {
    setState(() {
      dropdownValue = value;
    });
  }
}

List<DropdownMenuItem<String>> _mapNamesToDropdownMenuItems(
  List<String> list,
) {
  return list
      .map<DropdownMenuItem<String>>(
        (entry) => DropdownMenuItem(
          value: entry,
          child: Text(entry),
        ),
      )
      .toList();
}
