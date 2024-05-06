import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/core/utils/controller_registry.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/home.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

/// The page used as main entry point for this app.
class RouterOutlet extends StatefulWidget {
  const RouterOutlet({super.key});

  @override
  State<RouterOutlet> createState() => _RouterOutletState();
}

class _RouterOutletState extends State<RouterOutlet> {
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

    ControllerRegistry.disposeAll();
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
