import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';

/// The text used for the button label and the title of the statistics page.
const String _statisticsText = "Statistik";

/// The page used as main entry point for this app.
class HomePage extends StatelessWidget {
  /// Title of the page as shown in the appbar.
  final String _title;

  const HomePage(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Row(
        children: [_buildStatisticsRouteButton(context)],
      ),
    );
  }
}

/// Build a button that when clicked navigates the user towards the statistics page.
ElevatedButton _buildStatisticsRouteButton(BuildContext context) {
  final ElevatedButton statisticsButton = ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StatisticsPage(_statisticsText),
        ),
      );
    },
    child: const Text(_statisticsText),
  );

  return statisticsButton;
}
