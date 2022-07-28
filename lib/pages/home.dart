import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

/// Title of the page as shown in the appbar.
const String _title = "Home";

/// The page used as main entry point for this app.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Row(
        children: [
          getNavigationButton(
            context,
            _nagivateToStatisticsPage,
            "Statistik",
          ),
          getNavigationButton(
            context,
            _navigateToCalendarPage,
            "Kalender",
          ),
          getNavigationButton(
            context,
            _navigateToTrainingPlanListPage,
            "Trainingspläne",
          ),
        ],
      ),
    );
  }
}

/// Navigates towards the statistics page.
///
/// Uses the current [context] and then displays the statistic page widget with it.
void _nagivateToStatisticsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => StatisticsPage(),
    ),
  );
}

/// Navigates towards the calendar page.
///
/// Uses the current [context] and then displays the calendar page widget with it.
void _navigateToCalendarPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CalendarPage(),
    ),
  );
}

/// Navigates towards the training plan list page.
///
/// Uses the current [context] and then displays the training plan list page widget with it.
void _navigateToTrainingPlanListPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TrainingPlanListPage(),
    ),
  );
}
