import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';

const String _title = trainingPlanListRouteLabel;

class TrainingPlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrainingPlanPageState();
}

class _TrainingPlanPageState extends State<TrainingPlanPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const Column(
        children: [Text("inser table here!")],
      ),
    );
  }
}
