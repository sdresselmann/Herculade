import 'package:flutter/material.dart';

/// Creates a Button that when clicked adds a empty [tableEntry] to the table.
class AddEntryButton extends StatelessWidget {
  final void Function()? onPressed;

  const AddEntryButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text(" + "));
  }
}
