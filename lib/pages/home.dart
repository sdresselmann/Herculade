import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StatisticsPage("Statistik"),
              ),
            );
          },
          child: const Text("Statistik"),
        ),
      ),
    );
  }
}
