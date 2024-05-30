import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  final String headerText;

  const TableHeader({required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Text(headerText);
  }
}
