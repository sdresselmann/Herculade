import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';

/// Title of the page as shown in the appbar.
const String _title = "Home";

/// The page used as main entry point for this app.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Index of selected items, used for picking the page from [_navigationItems].
  int _selectedIndex = 0;

  /// List of pages that are navigated by clicking on the bottom app bar.
  static final List<Widget> _navigationItems = <Widget>[
    const Text(
      'Index 0: Home',
    ),
    CalendarPage(),
    TrainingPlanListPage(),
    StatisticsPage(),
  ];

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
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month),
      label: 'Kalender',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center),
      label: 'Trainingspläne',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.analytics),
      label: 'Statistik',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Center(child: _navigationItems.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent[800],
        onTap: _onItemTapped,
        // When using more than 3 items inside of a bottom navigation bar the
        // type is automatically changed to "shifting".
        //This messes with styling/formating which is not desired and requires
        //the type to be manually set.
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
