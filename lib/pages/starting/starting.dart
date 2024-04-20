import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/home.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

/// Title of the page as shown in the appbar.
const String _title = "Home";

/// The page used as main entry point for this app.
class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  /// Index of selected items, used for picking the page from [_navigationItems].
  int _selectedIndex = 0;

  /// List of pages that are navigated by clicking on the bottom app bar.
  late final List<Widget> _navigationItems;

  @override
  void initState() {
    super.initState();

    initNavigationItems();
  }

  void initNavigationItems() {
    _navigationItems = <Widget>[
      HomePage(),
      CalendarPage(),
      TrainingPlanListPage(),
      StatisticsPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Clickable icons inside of the navigation bar. Require a [onTap] method to
  /// be declared for the bottom app bar.
  static const List<BottomNavigationBarItem> _navigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: homeRouteLabel,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month),
      label: calendarRouteLabel,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center),
      label: trainingPlanListRouteLabel,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.analytics),
      label: statisticsRouteLabel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Center(
        child: _navigationItems.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent[800],
        onTap: _onItemTapped,

        // When using more than 3 items inside of a bottom navigation bar the type is automatically changed to "shifting".
        // This messes with styling/formatting which is not desired and requires the type to be manually set.
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
