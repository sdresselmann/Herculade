import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/components/navigation_button.dart';
import 'package:lifting_progress_tracker/constants/routes.dart';

/// Title of the page as shown in the appbar.
const String _title = "Home";

/// The page used as main entry point for this app.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Row(
        children: [
          getNavigationButton(
            context,
            statisticsRoute,
          ),
          getNavigationButton(
            context,
            calendarRoute,
          ),
          getNavigationButton(
            context,
            trainingplanListRoute,
          ),
        ],
      ),
    );
  }
}
