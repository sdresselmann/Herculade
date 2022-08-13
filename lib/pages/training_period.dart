import 'package:flutter/material.dart';

const String _title = "Training Period";

class TrainingPeriodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const Text("Training Period Screen"),
    );
  }
}
