import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/constants/localization.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          NavigationButton(trainingDayRouteLabel),
          NavigationButton(trainingPeriodRouteLabel),
        ],
      ),
    );
  }
}
