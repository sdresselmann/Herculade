import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';

/// The text used for the button label and the title of the statistics page.
const String statisticsText = "Statistik";

/// The page used as main entry point for the app.
class HomePage extends StatelessWidget {
  /// Title of the page as shown in the appbar.
  final String title;
  const HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Row(
        children: [buildStatisticsRouteButton(context)],
      ),
    );
  }
}

/// Build a button that when clicked navigates the user towards the statistics page.
ElevatedButton buildStatisticsRouteButton(BuildContext context) {
  final ElevatedButton statisticsButton = ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StatisticsPage(statisticsText),
        ),
      );
    },
    child: const Text(statisticsText),
  );

  return statisticsButton;
}
