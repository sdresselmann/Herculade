import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          getNavigationButton(context, trainingDayRouteLabel),
          getNavigationButton(context, trainingPeriodRouteLabel),
        ],
      ),
    );
  }
}
