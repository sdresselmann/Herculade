import 'package:flutter/material.dart';

class TrainingPlanListPage extends StatelessWidget {
  final String title;
  const TrainingPlanListPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Text("Trainingspläne Screen"),
    );
  }
}
