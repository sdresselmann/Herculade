import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Text("First Screen"),
    );
  }
}
