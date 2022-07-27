import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  final String title;
  const CalendarPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Text("Kalender Page"),
    );
  }
}
