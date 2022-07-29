import 'package:flutter/material.dart';

const String _title = "Trainings-Zeitraum";

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const Text("Trainings-Zeitraum Screen"),
    );
  }
}
