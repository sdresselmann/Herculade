import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';

const String _title = trainingPeriodRouteLabel;

class TrainingPeriodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const Text("Training Period Screen"),
    );
  }
}
