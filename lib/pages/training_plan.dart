import 'package:flutter/material.dart';

const String _title = "Trainingsplan";

class TrainingPlanListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const Text("Trainingsplan Screen"),
    );
  }
}
