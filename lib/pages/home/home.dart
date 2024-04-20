import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lifting_progress_tracker/auth/user_service.dart';
import 'package:lifting_progress_tracker/pages/calendar.dart';
import 'package:lifting_progress_tracker/pages/home/widgets/welcome_message.dart';
import 'package:lifting_progress_tracker/pages/statistics.dart';
import 'package:lifting_progress_tracker/pages/training_plan_list.dart';
import 'package:logging/logging.dart';

/// Title of the page as shown in the appbar.
const String _title = "Home";

/// The page used as main entry point for this app.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Logger _logger = Logger("HomePageState");

  /// Index of selected items, used for picking the page from [_navigationItems].
  int _selectedIndex = 0;

  /// List of pages that are navigated by clicking on the bottom app bar.
  late final List<Widget> _navigationItems;

  @override
  void initState() {
    super.initState();

    final UserService userService = GetIt.I.get<UserService>();

    _navigationItems = <Widget>[
      FutureBuilder(
        future: userService.userFuture,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return WelcomeMessage(
              username: snapshot.data!.email!,
            );
          }

          if (snapshot.hasError) {
            _logger.warning(
              "The welcome message could not be properly loaded: ${snapshot.error}",
            );
          }

          return const Text("unexpected Error!");
        },
      ),
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
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month),
      label: 'Calendar',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center),
      label: 'Training Schedules',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.analytics),
      label: 'Statistic',
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
