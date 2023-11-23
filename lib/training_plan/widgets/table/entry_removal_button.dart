import 'package:flutter/material.dart';

/// Creates a Button that when clicked removes its corresponding [tableEntry].
class EntryRemovalButton extends StatelessWidget {
  final void Function()? onPressed;

  const EntryRemovalButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text(" - "));
  }
}
