import 'package:flutter/material.dart';

const String _title = "Exercise";

class ExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const Text("Exercise Screen"),
    );
  }
}
