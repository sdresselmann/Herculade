import 'package:flutter/material.dart';

class TrainingplansPage extends StatelessWidget {
  final String title;
  const TrainingplansPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Text("Trainingspläne Screen"),
    );
  }
}
