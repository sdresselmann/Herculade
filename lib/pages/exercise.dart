import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';

const String _title = exerciseRouteLabel;

class ExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const Text("Exercise Screen"),
    );
  }
}
