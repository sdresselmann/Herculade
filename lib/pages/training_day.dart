import 'package:flutter/material.dart';

const String _title = "Trainingstag";

class TrainingDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const Text("Trainingstag Screen"),
    );
  }
}
