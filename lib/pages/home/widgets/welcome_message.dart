import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  final String username;

  const WelcomeMessage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello $username, how are you doing today?"),
    );
  }
}
