import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';
import 'package:lifting_progress_tracker/core/utils/controller_registry.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/home/home.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

class NavigationContainer extends StatefulWidget {
  final Widget initialPage;

  const NavigationContainer({required this.initialPage});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedIndex = 0;
  late Widget _selectedPage;
  late final List<Widget> _navigationItems;

  @override
  void initState() {
    super.initState();

    _selectedPage = widget.initialPage;
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
      _selectedPage = _navigationItems[index];
    });

    ControllerRegistry.disposeAll();
  }

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
        // child: _navigationItems.elementAt(_selectedIndex),
        child: _selectedPage,
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
