import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  final String title;
  const StatisticsPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Text("Statistik Screen"),
    );
  }
}
