import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';

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
            _navigateToRoute,
            statisticsRoute,
          ),
          getNavigationButton(
            context,
            _navigateToRoute,
            calendarRoute,
          ),
          getNavigationButton(
            context,
            _navigateToRoute,
            trainingplanListRoute,
          ),
        ],
      ),
    );
  }
}

/// Change the currently shown app page.
///
/// Uses the current [context] and navigates the app towards the page declared
/// by the [routeName].
void _navigateToRoute(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}
